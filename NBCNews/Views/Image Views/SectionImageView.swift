//
//  SectionImageView.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class SectionImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    func downloadPreviewImage(fromURL url: String) {
        NetworkManager.shared.downloadPreviewImage(from: url) { [weak self] (previewImage) in
            guard let self = self,
                let previewImage = previewImage else { return }
            
            DispatchQueue.main.async {
                self.image = previewImage
            }
        }
    }
}
