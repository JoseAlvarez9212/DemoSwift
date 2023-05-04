//
//  ListCharactersTableViewDataSource.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit
import SkeletonView

// MARK: ComicListTableViewDataSource : SkeletonTableViewDataSource
final class ComicListTableViewDataSource: NSObject, SkeletonTableViewDataSource {
    private let tableView: UITableView
    
    private(set) var characters:[Comic] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, characters: [Comic] = []) {
        self.tableView = tableView
        self.characters = characters
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return ComicListCellView.cellId
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ComicListCellView.cellId) as? ComicListCellView {
            let character = characters[indexPath.row]
            cell.configure(character)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func set(characters:[Comic]) {
        self.characters = characters
    }
}
