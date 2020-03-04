//
//  NewsPreviewTableViewCell.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/3/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NewsPreviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var previewImageView: SectionImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func set(newsArticle: NewsArticle) {
        guard let newsArtileHeadline = newsArticle.newsHeadline,
            let newsArticleSummary = newsArticle.newsSummary,
            let newsArticlePreviewImage = newsArticle.previewImage else { return }
        previewImageView.downloadPreviewImage(fromURL: newsArticlePreviewImage)
        headlineLabel.text = newsArtileHeadline
        summaryLabel.text = newsArticleSummary
    }
}
