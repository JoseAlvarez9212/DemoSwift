//
//  LoginController.swift
//  DemoSwift
//
//  Created by Jose on 27/02/23.
//

import Foundation
import UIKit

final class LoginController: UIViewController {
    
    private let userTextField: UIView = DemoButton(frame: .zero)
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userTextFielConfig()
    }
    
    private func userTextFielConfig()
    {
        view.addSubview(userTextField)
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextField.layout{
            $0.top == view.safeAreaLayoutGuide.topAnchor + 10
            $0.trailing == view.trailingAnchor - 10
            $0.leading == view.leadingAnchor + 10
        }
        
    }


}
