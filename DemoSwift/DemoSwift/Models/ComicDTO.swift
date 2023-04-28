//
//  CharacterModel.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation


struct ComicDTO : Decodable {
    let title: String
    let detail: String
    let thumbnail: ThumbnailComicDTO
    
    private enum CodingKeys : String, CodingKey {
        case title
        case detail = "description"
        case thumbnail
    }
    
    func toDomain() -> Comic {
        Comic.init(title: title,
                   description: detail ,
                   thumbnail: thumbnail.toDomain())
    }
}
