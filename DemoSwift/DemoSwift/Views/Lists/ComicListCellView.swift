//
//  CharacterListCellView.swift
//  DemoSwift
//
//  Created by Jose on 24/04/23.
//

import Foundation
import UIKit
import Kingfisher
import SkeletonView

// MARK: - ComicListCellView : DataTableViewCell
final class ComicListCellView : UITableViewCell {
    
    // MARK: - Properties
    
    static let cellId = "ComicListCellView"
    
    // MARK: UI Init
    
    let characterImageView:  UIImageView = {
        let imageView =  UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .italicSystemFont(ofSize: 15)
        label.clipsToBounds = true
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // UI
        setupView()
        
        // Skeleton
        setupSkeleton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not implemented")
    }
    
    // MARK: Public methods
    
    func configure(_ model: Comic) {
        self.titleLabel.text = model.title
        self.descriptionLabel.text = model.description
        self.characterImageView.kf.setImage(with: model.thumbnail.url)
    }
    
    // MARK: Private methods
    
    private func setupView() {
        contentView.addSubview(characterImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        
        characterImageView.layout {
            $0.leading == contentView.leadingAnchor
            $0.width == 120
            $0.height == 190
            $0.centerY == contentView.centerYAnchor
        }
        
        titleLabel.layout {
            $0.leading == characterImageView.trailingAnchor + 10
            $0.trailing == contentView.trailingAnchor
            $0.top == characterImageView.topAnchor + 10
            $0.height == 50
        }
        
        descriptionLabel.layout {
            $0.leading == titleLabel.leadingAnchor
            $0.trailing == titleLabel.trailingAnchor
            $0.top == titleLabel.bottomAnchor + 10
            $0.bottom == characterImageView.bottomAnchor - 10
        }
        
    }
    
    private func setupSkeleton() {
        isSkeletonable = true
        characterImageView.isSkeletonable = true
        titleLabel.isSkeletonable = true
        descriptionLabel.isSkeletonable = true
    }
}
