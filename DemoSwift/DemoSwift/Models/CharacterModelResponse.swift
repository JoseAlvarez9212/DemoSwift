//
//  CharacterModelResponse.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation

struct CharacterModelResponse : Decodable{
    let limit: Int
    let total: Int
    let count: Int
    let results: [CharacterModel]

}
