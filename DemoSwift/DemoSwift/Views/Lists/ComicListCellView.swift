//
//  CharacterListCellView.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit
import Kingfisher

class ComicListCellView : UITableViewCell {
    
    let stackContainer: UIStackView = {
        let stackv = UIStackView()
        stackv.translatesAutoresizingMaskIntoConstraints = false
        stackv.axis = .vertical
        return stackv
    }()
    
    let stackViewComic: UIStackView = {
        let stackv = UIStackView()
        stackv.translatesAutoresizingMaskIntoConstraints = false
        stackv.axis = .vertical
        stackv.backgroundColor = UIColor.init(red: 114, green: 13, blue: 93)
        
        stackv.layer.cornerRadius = 10
        stackv.clipsToBounds = true
        
        //stackv.layer.shadowColor = UIColor.black.cgColor
        //stackv.layer.shadowOpacity = 1
        //stackv.layer.shadowOffset = .zero
        //stackv.layer.shadowRadius = 3
        
        return stackv
    }()
    
    let characterImageView:  UIImageView = {
        let imageView =  UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .italicSystemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    let separatorTopView: UIView = {
        let view = UIView()
        //view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let separatorBottomView: UIView = {
        let view = UIView()
        //view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    func setupView() {
        stackViewComic.addSubview(characterImageView)
        stackViewComic.addSubview(titleLabel)
        stackViewComic.addSubview(descriptionLabel)
        
        stackContainer.addSubview(separatorTopView)
        stackContainer.addSubview(stackViewComic)
        stackContainer.addSubview(separatorBottomView)
        addSubview(stackContainer)
        
        separatorTopView.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == topAnchor
            $0.height == 5
        }
        
        stackContainer.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == separatorTopView.bottomAnchor
            $0.bottom == separatorBottomView.topAnchor
            //$0.height == 100
        }
        
        stackViewComic.layout{
            $0.leading == stackContainer.leadingAnchor + 5
            $0.trailing == stackContainer.trailingAnchor - 5
            $0.top == stackContainer.topAnchor
            //$0.bottom == bottomAnchor
            $0.height == 190
        }
        
        characterImageView.layout{
            $0.leading == stackViewComic.leadingAnchor
            $0.width == 120
            $0.height == 190
            $0.centerY == stackViewComic.centerYAnchor
        }
        
        titleLabel.layout{
            $0.leading == characterImageView.trailingAnchor + 10
            $0.trailing == stackViewComic.trailingAnchor
            $0.top == stackViewComic.topAnchor + 10
        }
        
        descriptionLabel.layout{
            $0.leading == titleLabel.leadingAnchor
            $0.trailing == titleLabel.trailingAnchor
            $0.top == titleLabel.bottomAnchor + 10
        }
        
        separatorBottomView.layout{
            $0.leading == leadingAnchor
            $0.trailing == trailingAnchor
            $0.top == stackViewComic.bottomAnchor
            $0.height == 5
        }
    }
    
    func configure(_ model: Comic) {
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.characterImageView.kf.setImage(with: model.thumbnail.url)
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
