//
//  ComicsViewController.swift
//  DemoSwift
//
//  Created by Jose on 26/04/23.
//

import Foundation
import UIKit

/*
protocol ComicsViewProtocol: AnyObject {
    func showComics(_ comics: [Comic])
    func showError(message: String)
}
*/

protocol ComicsViewDelegate: NSObjectProtocol {
    func comicView(_ view: ComicsView, didRefreshData data: [Any])
}

protocol ComicsViewProtocolNew: NSObjectProtocol {
    var delegate: ComicsViewDelegate? { get set }
    func reloadData(_ arrayData:[Any])
}

class ComicsView : UIView {
    
    weak var delegate: ComicsViewDelegate?
    
    private var tableViewDataSource: ComicListTableViewDataSource?
    private var tableViewDelegate: ListOfComicTableViewDelegate?
    
    
    //var mainView: ComicListView { self.view as! ComicListView }
    //var comicView: ComicsView { self.view as! ComicsView }
    //private var tableViewDataSource: ComicListTableViewDataSource?
    //private var tableViewDelegate: ListOfComicTableViewDelegate?
    var presenter: ComicsViewPresenterProtocol?
    var comics: [Comic] = []
    
    
    /*
    let searchBarComic: UISearchBar = {
        let searchbar =  UISearchBar()
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
    }()
     */
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ComicListCellView.self, forCellReuseIdentifier: "ComicListCellView")
        return tableView
    }()
    /*
    let comicListView : UIView = {
       let comicView = UIView()
        comicView.translatesAutoresizingMaskIntoConstraints = false
        return comicView
    }()
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not implemented")
    }

    func setupView() {
        //addSubview(searchBarComic)
        addSubview(characterTableView)
        
        /*
        searchBarComic.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == topAnchor
            $0.bottom == bottomAnchor
        }
         */
        
        characterTableView.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == topAnchor
            $0.bottom == bottomAnchor
        }
        
        tableViewDelegate = ListOfComicTableViewDelegate()
        tableViewDataSource = ComicListTableViewDataSource(tableView: characterTableView)
        characterTableView.dataSource = tableViewDataSource
        characterTableView.delegate = tableViewDelegate
        
        
        let interactor = ComicsViewInteractor()
        let presenter = ComicsViewPresenter(interactor: interactor)
        /*
        presenter.view = self
        self.presenter = presenter
        self.presenter?.viewDidLoad()
         */
    }
}
/*
 extension ComicsView: ComicsViewProtocol {
 func showComics(_ comics: [Comic]) {
 self.comics = comics
 self.tableViewDataSource?.set(characters: self.comics)
 }
 
 func showError(message: String) {
 //self.present(on: self, message: message)
 }
 }
 
 */
 
