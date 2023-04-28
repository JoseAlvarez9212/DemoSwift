//
//  ComicsViewPresenter.swift
//  DemoSwift
//
//  Created by Jose on 26/04/23.
//

import Foundation

protocol ComicsViewPresenterProtocol {
    func viewDidLoad()
}


class ComicsViewPresenter : ComicsViewPresenterProtocol {
    
    weak var view: ComicsViewProtocol?
    var interactor:ComicsViewInteractorProtocol?
    
    init(interactor: ComicsViewInteractorProtocol) {
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        Task {
            await loadComics()
        }
    }
    
    func loadComics() async {
        await interactor?.fetchComics(success: { comics in
            self.view?.showComics(comics)
        }, failure: { message in
            self.view?.showError(message: message)
        })
    }
    
}
