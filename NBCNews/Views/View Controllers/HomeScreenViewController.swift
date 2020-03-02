//
//  HomeScreenViewController.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    let sectionsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSectionsTableView()
    }
    

    func configureSectionsTableView() {
        view.addSubview(sectionsTableView)
        sectionsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        sectionsTableView.frame = view.bounds
        sectionsTableView.rowHeight = 120
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        
        sectionsTableView.register(SectionTableViewCell.self, forCellReuseIdentifier: SectionTableViewCell.reuseID)
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.reuseID) as? SectionTableViewCell else { return UITableViewCell() }
        
        cell.configure()
        cell.sectionTitleLabel.text = "TITLE GOES HERE"
        
        return cell
    }
}
