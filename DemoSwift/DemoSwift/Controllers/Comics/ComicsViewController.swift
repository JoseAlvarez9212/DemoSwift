//
//  ComicsViewController.swift
//  DemoSwift
//
//  Created by Jose on 28/04/23.
//

import Foundation
import UIKit
import SkeletonView

protocol ComicsViewProtocol: AnyObject {
    func showComics(_ comics: [Comic])
    func showError(message: String)
}

class ComicsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var tableViewDataSource: ComicListTableViewDataSource?
    private var tableViewDelegate: ListOfComicTableViewDelegate?
    var presenter: ComicsViewPresenterProtocol?
    var comics: [Comic] = []
    
    // MARK: UI Init
    
    var containerView: UIView = {
        let cView =  UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ComicListCellView.self, forCellReuseIdentifier: ComicListCellView.cellId)
        tableView.estimatedRowHeight = 100
        return tableView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comics"
        Configure()
        tableViewDelegate = ListOfComicTableViewDelegate()
        tableViewDataSource = ComicListTableViewDataSource(tableView: characterTableView)
        self.characterTableView.dataSource = tableViewDataSource
        self.characterTableView.delegate = tableViewDelegate
        
        let interactor = ComicsViewInteractor()
        let presenter = ComicsViewPresenter(interactor: interactor)
        
        presenter.view = self
        self.presenter = presenter
        self.presenter?.viewDidLoad()
        
        setupSkeleton()
    }
    
    // MARK: Private methods
    
    private func Configure() {
        containerView = ComicListView()
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
    }
    
    private func setupSkeleton() {
        self.characterTableView.isSkeletonable = true
        self.characterTableView.showAnimatedGradientSkeleton()
    }
}

extension ComicsViewController: ComicsViewProtocol {
    func showComics(_ comics: [Comic]) {
        self.comics = comics
        self.tableViewDataSource?.set(characters: self.comics)
        DispatchQueue.main.async {
            self.characterTableView.hideSkeleton()
        }
    }
    
    func showError(message: String) {
        //self.present(on: self, message: message)
    }
}
