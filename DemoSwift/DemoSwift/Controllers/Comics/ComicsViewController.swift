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

    private var tableViewDataSource: ComicListTableViewDataSource?
    private var tableViewDelegate: ListOfComicTableViewDelegate?
    var presenter: ComicsViewPresenterProtocol?
    var comics: [Comic] = []
    
    
    var containerView: UIView = {
        let cView =  UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ComicListCellView.self, forCellReuseIdentifier: "ComicListCellView")
        
        return tableView
    }()
    
    
    override func loadView() {
        super.loadView()
        
        Configure()
                
        tableViewDelegate = ListOfComicTableViewDelegate()
        tableViewDataSource = ComicListTableViewDataSource(tableView: characterTableView)
        characterTableView.dataSource = tableViewDataSource
        characterTableView.delegate = tableViewDelegate
    }
    
    func Configure() {
        view.addSubview(containerView)
        containerView.addSubview(characterTableView)
        
        containerView.layout {
            $0.leading == view.safeAreaLayoutGuide.leadingAnchor
            $0.trailing == view.safeAreaLayoutGuide.trailingAnchor
            $0.top == view.safeAreaLayoutGuide.topAnchor
            $0.bottom == view.safeAreaLayoutGuide.bottomAnchor
        }
        characterTableView.layout{
            $0.leading == containerView.leadingAnchor + 5
            $0.trailing == containerView.trailingAnchor - 5
            $0.top == containerView.topAnchor
            $0.bottom == containerView.bottomAnchor
        }
        
        containerView = ComicListView()
        view.addSubview(containerView)
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
 
 
