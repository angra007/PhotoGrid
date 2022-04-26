//
//  PhotoGridCell.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import UIKit

class PhotoGridCell: UICollectionViewCell {
    
    public static let identifier = "photoGrid"
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
    func bind(photo: Photo) {
        imageView.image = photo.image
    }
}
