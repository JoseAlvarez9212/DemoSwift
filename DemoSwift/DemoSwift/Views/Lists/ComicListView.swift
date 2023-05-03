//
//  CharacterListView.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit

class ComicListView : UIView {
    let containerView: UIView = {
        let cView =  UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        //cView.backgroundColor = UIColor.red
        return cView
    }()
    
    let characterTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ComicListCellView.self, forCellReuseIdentifier: "ComicListCellView")
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
        addSubview(containerView)
        containerView.addSubview(characterTableView)
        containerView.layout {
            $0.leading == safeAreaLayoutGuide.leadingAnchor
            $0.trailing == safeAreaLayoutGuide.trailingAnchor
            $0.top == safeAreaLayoutGuide.topAnchor
            $0.bottom == safeAreaLayoutGuide.bottomAnchor
        }
        characterTableView.layout{
            $0.leading == containerView.leadingAnchor
            $0.trailing == containerView.trailingAnchor
            $0.top == containerView.topAnchor
            $0.bottom == containerView.bottomAnchor
        }
        
    }
}
