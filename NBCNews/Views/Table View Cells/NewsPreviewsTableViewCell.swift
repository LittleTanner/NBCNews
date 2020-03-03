//
//  NewsPreviewsTableViewCell.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class NewsPreviewsTableViewCell: UITableViewCell {
    
    static let reuseID = "NewsPreviewCell"
    
    let previewImageView = SectionImageView(frame: .zero)
    let headlineLabel = UILabel()
    let summaryLabel = UILabel()
    
    var placeholderImage = UIImage(named: "nbcLogo")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(newsArticle: NewsArticle) {
        guard let newsArtileHeadline = newsArticle.newsHeadline,
            let newsArticleSummary = newsArticle.newsSummary,
            let newsArticlePreviewImage = newsArticle.previewImage else { return }
        previewImageView.downloadPreviewImage(fromURL: newsArticlePreviewImage)
        headlineLabel.text = newsArtileHeadline
        summaryLabel.text = newsArticleSummary
    }
    
    
    func configure() {
        addSubview(previewImageView)
        addSubview(headlineLabel)
        addSubview(summaryLabel)
        
        previewImageView.image = placeholderImage
        
        headlineLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headlineLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        headlineLabel.numberOfLines = 3
        headlineLabel.lineBreakMode = .byWordWrapping
        
        summaryLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        summaryLabel.numberOfLines = 4
        summaryLabel.lineBreakMode = .byWordWrapping
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            previewImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            previewImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            previewImageView.heightAnchor.constraint(equalToConstant: 80),
            previewImageView.widthAnchor.constraint(equalToConstant: 80),
            
            headlineLabel.topAnchor.constraint(equalTo: previewImageView.topAnchor),
            headlineLabel.leadingAnchor.constraint(equalTo: previewImageView.trailingAnchor, constant: padding),
            headlineLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            headlineLabel.heightAnchor.constraint(equalToConstant: 60),
            
            summaryLabel.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: padding),
            summaryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            summaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            summaryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding)
        ])
    }
}
