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
    
    func configure() {
        addSubview(sectionImageView)
        addSubview(sectionTitleLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            sectionImageView.topAnchor.constraint(equalTo: self.topAnchor),
            sectionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sectionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            sectionImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            sectionTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            sectionTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            sectionTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            sectionTitleLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}
