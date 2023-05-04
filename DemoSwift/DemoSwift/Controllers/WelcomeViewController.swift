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
}
