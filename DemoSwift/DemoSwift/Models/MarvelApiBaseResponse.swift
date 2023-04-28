//
//  ApiMarvelModelResponse.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation

struct MarvelApiBaseResponse<T: Decodable> : Decodable{
    let code: Int
    let status: String
    let data: PageDTO<T>
}

struct PageDTO<T: Decodable> : Decodable{
    let limit: Int
    let total: Int
    let offset: Int
    let results: [T]
}
 
