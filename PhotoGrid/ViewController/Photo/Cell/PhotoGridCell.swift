//
//  PhotoGridCell.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import UIKit

class PhotoGridCell: UICollectionViewCell, XibInitializable {
    
    public static let identifier = "photoGrid"
    
    @IBOutlet weak var imageView: UIImageView!
    
    func bind(photo: Photo) {
        imageView.image = photo.image
    }
}
