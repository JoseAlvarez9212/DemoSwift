//
//  DemoButton.swift
//  DemoSwift
//
//  Created by Jose on 27/02/23.
//

import Foundation
import UIKit

@IBDesignable
class DemoButton : UIView
{
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - UI Setup
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        //label.text = "Title button"
        label.font = UIFont(name: "ArialMT", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Ingrese"
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "error button"
        label.textColor = .red
        label.font = UIFont(name: "ArialMT" , size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @IBInspectable
    var title: String = "Title" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private func AddProperties()
    {
        self.titleLabel.text = title
    }
    
    private func addSubviews()
    {
        [
            titleLabel,
            textField,
            errorLabel
        ].forEach(addSubview)
    }
    
    private func configConstraint()
    {
        titleLabel.layout{
            $0.top == topAnchor + 10
            $0.trailing == trailingAnchor - 10
            $0.leading == leadingAnchor + 15
        }
        
        textField.layout {
            $0.top == titleLabel.bottomAnchor + 5
            $0.trailing == trailingAnchor - 10
            $0.leading == leadingAnchor + 10
        }
        
        errorLabel.layout{
            $0.top == textField.bottomAnchor + 5
            $0.trailing == trailingAnchor - 10
            $0.leading == leadingAnchor + 15
        }
    }
    
    private func setupView()
    {
        addSubviews()
        AddProperties()
        configConstraint()
    }
    
}
