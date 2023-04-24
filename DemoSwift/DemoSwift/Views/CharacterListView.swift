//
//  CharacterListView.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit

class CharacterListView : UIView {
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
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
