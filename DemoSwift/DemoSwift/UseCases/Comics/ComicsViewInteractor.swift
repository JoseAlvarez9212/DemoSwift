//
//  ComicsViewInteractor.swift
//  DemoSwift
//
//  Created by Jose on 26/04/23.
//

import Foundation

protocol ComicsViewInteractorProtocol {
    func fetchComics(success: @escaping ([Comic]) -> Void, failure: @escaping (String) -> Void) async
}

class ComicsViewInteractor : ComicsViewInteractorProtocol {
    
    var apiService: ApiMarvelServicesProtocol?
    
    init() {
        apiService = ApiMarvelServices()
    }
    
    func fetchComics(success: @escaping ([Comic]) -> Void, failure: @escaping (String) -> Void) async {
        let comicResponse = await apiService?.GetMarvelApi(dataModel: ComicDTO.self)
        if(comicResponse?.code == 200) {
            guard let data = comicResponse?.data else {
                failure("Error al obtener los datos")
                return
            }
            let comics = data.results.map {$0.toDomain()}
            success(comics)
        }
        else {
            failure("Error al obtener los datos")
        }
    }
}
