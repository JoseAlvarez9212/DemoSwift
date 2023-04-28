//
//  WelcomeViewController.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBAction func btnComics(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "ComicsView", bundle: nil)
        guard  let comicsController = storyboard.instantiateViewController(identifier: "ComicsViewControllerID") as? ComicsViewController  else {
            return
        }
        //self.navigationController?.title = "Comics"
        self.navigationController?.pushViewController(comicsController, animated: true)
        
    }
    
    /*
    var mainView: CharacterListView { self.view as! CharacterListView }
    var apiService = ApiMarvelServices()
    private var tableViewDataSource: ListCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
        
    override func loadView() {
        super.loadView()
        
        view = CharacterListView()
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        tableViewDataSource = ListCharactersTableViewDataSource(tableView: mainView.characterTableView)
        mainView.characterTableView.dataSource = tableViewDataSource
        mainView.characterTableView.delegate = tableViewDelegate
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            let characters = await apiService.getListOfCharacters()
            print("Characters \(characters)")
            tableViewDataSource?.set(characters: characters.data.results)
        }
    
    } */
}
