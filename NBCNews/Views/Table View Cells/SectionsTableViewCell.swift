//
//  SectionsTableViewCell.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/3/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class SectionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sectionImageView: SectionImageView!
    @IBOutlet weak var sectionTitleLabel: SectionTitleLabel!
    
    func set(sections: Section) {
        guard let newsTitle = sections.newsTitle else { return }
        sectionTitleLabel.text = newsTitle.uppercased()
        guard let previewImage = sections.previewImage else { return }
        sectionImageView.downloadPreviewImage(fromURL: previewImage)
    }
}
