//
//  Thumbnail.swift
//  DemoSwift
//
//  Created by Jose on 26/04/23.
//

import Foundation

struct ThumbnailComic {
    let path: String
    let `extension`: String
    var url: URL? { URL(string: "\(path.replacingOccurrences(of: "http:", with: "https:")).\(`extension`)")}
}
