//
//  ApiMarvelServices.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation

final class ApiMarvelServices {
    func getListOfCharacters() async -> ApiMarvelModelResponse {
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?ts=1000&apikey=4d8f080114fe7f0966d57e04efb1d3b9&hash=d75a50da4fda0ad60e466397bbdf43a9")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(ApiMarvelModelResponse.self, from: data)
    }
}
