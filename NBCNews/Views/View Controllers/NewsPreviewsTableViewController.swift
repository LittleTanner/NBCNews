//
//  NewsPreviewsTableViewController.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/4/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NewsPreviewsTableViewController: UITableViewController {

    var section: Section?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NewsPreviewTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PreviewXIBCell")
        tableView.rowHeight = 160
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = self.section,
            let newsArticles = section.newsArticles else { return 0 }
        return newsArticles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewXIBCell") as? NewsPreviewTableViewCell else { return UITableViewCell() }
        
        guard let section = self.section,
            let newsArticles = section.newsArticles else { return UITableViewCell() }
        
        let newsArticle = newsArticles[indexPath.row]
        
        cell.set(newsArticle: newsArticle)
        
        return cell
    }
}
