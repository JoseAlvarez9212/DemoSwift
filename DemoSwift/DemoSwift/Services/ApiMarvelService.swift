//
//  ApiMarvelServices.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation

protocol ApiMarvelServicesProtocol {
    func GetMarvelApi<T : Decodable>(dataModel: T.Type) async -> MarvelApiBaseResponse<T>
}

final class ApiMarvelServices : ApiMarvelServicesProtocol{
    //let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?ts=1000&apikey=4d8f080114fe7f0966d57e04efb1d3b9&hash=d75a50da4fda0ad60e466397bbdf43a9")!
    //let ts = "\(Date().timeIntervalSince1970)"
    let ts = "1000"
    let publicKey = "4d8f080114fe7f0966d57e04efb1d3b9"
    let privateKey = "7caeae1d226f4eb46234de2267bb74c81c1ac0e6"
    let hash = "d75a50da4fda0ad60e466397bbdf43a9"
    let limit = 10
    
    func GetMarvelApi<T : Decodable>(dataModel: T.Type) async -> MarvelApiBaseResponse<T> {
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/comics?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)&orderBy=-modified&limit=\(limit)")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let resultado = try! JSONDecoder().decode(MarvelApiBaseResponse<T>.self, from: data)
        print(data)
        return resultado
    }
}
