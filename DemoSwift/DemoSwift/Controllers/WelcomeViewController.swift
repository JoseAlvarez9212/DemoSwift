//
//  WelcomeViewController.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    var mainView: CharacterListView { self.view as! CharacterListView }
    var apiService = ApiMarvelServices()
    private var tableViewDataSource: ListCharactersTableViewDataSource?
        
    override func loadView() {
        super.loadView()
        
        view = CharacterListView()
        tableViewDataSource = ListCharactersTableViewDataSource(tableView: mainView.characterTableView)
        mainView.characterTableView.dataSource = tableViewDataSource
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let characters = await apiService.getListOfCharacters()
            print("Characters \(characters)")
            tableViewDataSource?.set(characters: characters.data.results)
        }
    }
}
