//
//  ApiMarvelModelResponse.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation

struct ApiMarvelModelResponse : Decodable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let data: CharacterModelResponse
}
