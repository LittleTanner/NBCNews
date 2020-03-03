//
//  NewsPreviewsViewController.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NewsPreviewsViewController: UIViewController {
    
    let newsPreviewsTableView = UITableView()
    
    var section: Section?
    
    init(section: Section) {
        super.init(nibName: nil, bundle: nil)
        self.section = section
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNewsPreviewsTableView()
    }
    
    
    func configureNewsPreviewsTableView() {
        view.addSubview(newsPreviewsTableView)
        newsPreviewsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        newsPreviewsTableView.frame = view.bounds
        newsPreviewsTableView.rowHeight = 160
        newsPreviewsTableView.separatorStyle = .none
        newsPreviewsTableView.delegate = self
        newsPreviewsTableView.dataSource = self
        
        newsPreviewsTableView.register(NewsPreviewsTableViewCell.self, forCellReuseIdentifier: NewsPreviewsTableViewCell.reuseID)
    }
}

extension NewsPreviewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.section,
            let newsArticles = section.newsArticles else { return 0 }
        return newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsPreviewsTableViewCell.reuseID) as? NewsPreviewsTableViewCell else { return UITableViewCell() }
        
        guard let section = self.section,
            let newsArticles = section.newsArticles else { return UITableViewCell() }
        
        let newsArticle = newsArticles[indexPath.row]
        
        cell.set(newsArticle: newsArticle)
        
        return cell
    }
    
    
}
