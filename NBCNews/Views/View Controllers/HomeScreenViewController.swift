//
//  HomeScreenViewController.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var sectionsTableView: UITableView!
    
    var sections: [Section] = [] {
        didSet {
            DispatchQueue.main.async {
                self.sectionsTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        let nib = UINib(nibName: "SectionsTableViewCell", bundle: nil)
        sectionsTableView.register(nib, forCellReuseIdentifier: "SectionXIBCell")
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
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SectionXIBCell") as? SectionsTableViewCell else { return UITableViewCell() }
        
        let section = sections[indexPath.row]
        cell.set(sections: section)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSectionCell = sections[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(identifier: "NewsPreviewID") as? NewsPreviewViewController else { return }
        destinationViewController.section = selectedSectionCell
        
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
