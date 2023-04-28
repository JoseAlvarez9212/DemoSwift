//
//  ThumbnailComicDTO.swift
//  DemoSwift
//
//  Created by Jose on 28/04/23.
//

import Foundation

struct ThumbnailComicDTO: Decodable {
    let path: String
    let `extension`: String
    
    func toDomain() -> ThumbnailComic {
        ThumbnailComic.init(path: path,
                            extension: `extension`)
    }
}
