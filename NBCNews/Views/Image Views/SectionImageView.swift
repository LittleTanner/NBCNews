//
//  SectionImageView.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import UIKit

class SectionImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "nbcLogo")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        layer.cornerRadius = 20
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
