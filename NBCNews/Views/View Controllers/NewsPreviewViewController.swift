//
//  NewsPreviewViewController.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/4/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NewsPreviewViewController: UIViewController {
    
    
    @IBOutlet weak var newsPreviewTableView: UITableView!
    
    var section: Section?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNewsPreviewTableView()
    }
    
    func configureNewsPreviewTableView() {
        newsPreviewTableView.delegate = self
        newsPreviewTableView.dataSource = self
        
        let nib = UINib(nibName: "NewsPreviewTableViewCell", bundle: nil)
        newsPreviewTableView.register(nib, forCellReuseIdentifier: "PreviewXIBCell")
        
        newsPreviewTableView.rowHeight = 160
        newsPreviewTableView.separatorStyle = .none
    }
    
}

extension NewsPreviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.section,
            let newsArticles = section.newsArticles else { return 0 }
        return newsArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewXIBCell") as? NewsPreviewTableViewCell else { return UITableViewCell() }
        
        guard let section = self.section,
            let newsArticles = section.newsArticles else { return UITableViewCell() }
        
        let newsArticle = newsArticles[indexPath.row]
        
        cell.set(newsArticle: newsArticle)
        
        return cell
    }
}
