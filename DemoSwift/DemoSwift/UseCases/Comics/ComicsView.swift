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
class CommicsView : UIView {
    
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ComicListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not implemented")
    }
    
    func setupView() {
        addSubview(characterTableView)
        
        characterTableView.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == topAnchor
            $0.bottom == bottomAnchor
        }
    }
}
