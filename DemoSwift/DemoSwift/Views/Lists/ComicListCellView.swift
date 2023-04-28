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
    let characterImageView:  UIImageView = {
        let imageView =  UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let characterName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let characterDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    func setupView() {
        addSubview(characterImageView)
        addSubview(characterName)
        addSubview(characterDescription)
        
        characterImageView.layout{
            $0.leading == leadingAnchor + 12
            $0.top == topAnchor + 12
            $0.height == 80
            $0.width == 80
        }
        
        characterName.layout{
            $0.leading == characterImageView.trailingAnchor + 20
            $0.top == characterImageView.topAnchor
        }
        
        characterDescription.layout{
            $0.leading == characterName.leadingAnchor
            $0.top == characterName.bottomAnchor + 8
        }
    }
    
    func configure(_ model: Comic) {
        self.characterName.text = model.title
        self.characterDescription.text = model.description
        self.characterImageView.kf.setImage(with: model.thumbnail.url)
    }
}
