//
//  NewsPreviewsViewController.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

//class NewsPreviewsViewController: UIViewController {
//
//    
//    @IBOutlet weak var newsPreviewTableView: UITableView!
//    var section: Section?
//
//    
//    init(section: Section) {
//        super.init(nibName: nil, bundle: nil)
//        self.section = section
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        newsPreviewTableView.delegate = self
//        newsPreviewTableView.dataSource = self
//        let nib = UINib(nibName: "NewsPreviewTableViewCell", bundle: nil)
//        newsPreviewTableView.register(nib, forCellReuseIdentifier: "previewCell")
//    }
//
//}
//
//extension NewsPreviewsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let section = self.section,
//            let newsArticles = section.newsArticles else { return 0 }
//        return newsArticles.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "previewCell") as? NewsPreviewTableViewCell else { return UITableViewCell() }
//        
//        guard let section = self.section,
//            let newsArticles = section.newsArticles else { return UITableViewCell() }
//        
//        let newsArticle = newsArticles[indexPath.row]
//        
//        cell.set(newsArticle: newsArticle)
//        
//        return cell
//    }
//}
