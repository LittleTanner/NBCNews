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
    
    var sections: [Section] = [] {
        didSet {
            DispatchQueue.main.async {
                self.sectionsTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSectionsTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NetworkManager.shared.getSections { [weak self] (sections) in
            guard let self = self,
                  let sections = sections else { return }
            
            var sectionWithTitle: [Section] = []
            
            // Filters out any news sections that don't have the section title "Section" and don't have a previewImage
            for section in sections {
                if section.newsType == "Section" && section.previewImage != nil {
                    sectionWithTitle.append(section)
                }
            }
            self.sections = sectionWithTitle
        }
    }
    

    func configureSectionsTableView() {
        view.addSubview(sectionsTableView)
        sectionsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        sectionsTableView.frame = view.bounds
        sectionsTableView.rowHeight = 200
        sectionsTableView.separatorStyle = .none
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        
        sectionsTableView.register(SectionTableViewCell.self, forCellReuseIdentifier: SectionTableViewCell.reuseID)
    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SectionTableViewCell.reuseID) as? SectionTableViewCell else { return UITableViewCell() }
        
        let section = sections[indexPath.row]
        cell.set(sections: section)
        
        return cell
    }
}
