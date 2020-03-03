//
//  Section.swift
//  NBCNews
//
//  Created by Kevin Tanner on 3/2/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import Foundation

struct TopLevel: Codable {
    let data: [Section]
}

struct Section: Codable {
    enum CodingKeys: String, CodingKey {
        case newsType = "type"
        case newsTitle = "header"
        case previewImage = "tease"
    }
    
    let newsType: String
    let newsTitle: String?
    let previewImage: String?
}
