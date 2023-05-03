//
//  ListOfCharactersTableViewDelegate.swift
//  DemoSwift
//
//  Created by Jose on 25/04/23.
//

import Foundation
import UIKit

class ListOfComicTableViewDelegate :NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
