//
//  SectionTableViewCell.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    static let reuseID = "SectionCell"
    
    let sectionImageView = SectionImageView(frame: .zero)
    let sectionTitleLabel = SectionTitleLabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(sections: Section) {
        guard let newsTitle = sections.newsTitle else { return }
        sectionTitleLabel.text = newsTitle.uppercased()
        guard let previewImage = sections.previewImage else { return }
        sectionImageView.downloadPreviewImage(fromURL: previewImage)
    }
    
    func configure() {
        addSubview(sectionImageView)
        addSubview(sectionTitleLabel)
        
        backgroundColor = .systemGray5
        
        let padding: CGFloat = 2
        
        NSLayoutConstraint.activate([
            sectionImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding/2),
            sectionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            sectionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            sectionImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding/2),
            
            sectionTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            sectionTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            sectionTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            sectionTitleLabel.heightAnchor.constraint(equalToConstant: 34)
        ])
    }
}
