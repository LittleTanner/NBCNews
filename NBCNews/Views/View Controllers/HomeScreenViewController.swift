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
//        configureSectionsTableView()
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
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
    

//    func configureSectionsTableView() {
//        view.addSubview(sectionsTableView)
//        sectionsTableView.translatesAutoresizingMaskIntoConstraints = false
//
//        sectionsTableView.frame = view.bounds
//        sectionsTableView.rowHeight = 200
//        sectionsTableView.separatorStyle = .none
//        sectionsTableView.delegate = self
//        sectionsTableView.dataSource = self
        
//        sectionsTableView.register(SectionTableViewCell.self, forCellReuseIdentifier: SectionTableViewCell.reuseID)
//    }
}

extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as? SectionTableViewCell else { return UITableViewCell() }
        
        let section = sections[indexPath.row]
        cell.set(sections: section)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedSectionCell = sections[indexPath.row]
//        let destinationViewController = NewsPreviewsViewController(section: selectedSectionCell)
//        
//        navigationController?.pushViewController(destinationViewController, animated: true)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewsPreviews" {
            
            if let destinationViewController = segue.destination as? NewsPreviewsViewController {
                
                if let indexPath = sectionsTableView.indexPathForSelectedRow {
                    let section = sections[indexPath.row]
                    destinationViewController.section = section
                }
            }
        }
    }
}
