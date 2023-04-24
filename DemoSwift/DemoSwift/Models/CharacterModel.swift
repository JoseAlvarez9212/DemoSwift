//
//  CharacterModel.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation

struct CharacterModel : Decodable{
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail : Decodable{
    let path: String
    let extensionPath: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionPath = "extension"
    }
}
