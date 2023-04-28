//
//  ComicsViewController.swift
//  DemoSwift
//
//  Created by Jose on 28/04/23.
//

import Foundation
import UIKit

protocol ComicsViewProtocol: AnyObject {
    func showComics(_ comics: [Comic])
    func showError(message: String)
}

class ComicsViewController: UIViewController {

    var mainView: ComicListView { self.view as! ComicListView }
    private var tableViewDataSource: ComicListTableViewDataSource?
    private var tableViewDelegate: ListOfComicTableViewDelegate?
    
    var presenter: ComicsViewPresenterProtocol?
    var comics: [Comic] = []
    
    override func loadView() {
        super.loadView()
        
        view = ComicListView()
        tableViewDelegate = ListOfComicTableViewDelegate()
        tableViewDataSource = ComicListTableViewDataSource(tableView: mainView.characterTableView)
        mainView.characterTableView.dataSource = tableViewDataSource
        mainView.characterTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let interactor = ComicsViewInteractor()
        let presenter = ComicsViewPresenter(interactor: interactor)
        
        presenter.view = self
        self.presenter = presenter
        self.presenter?.viewDidLoad()
    }
    
}

 extension ComicsViewController: ComicsViewProtocol {
     func showComics(_ comics: [Comic]) {
         self.comics = comics
         self.tableViewDataSource?.set(characters: self.comics)
     }
     
     func showError(message: String) {
     //self.present(on: self, message: message)
     }
 }
 
