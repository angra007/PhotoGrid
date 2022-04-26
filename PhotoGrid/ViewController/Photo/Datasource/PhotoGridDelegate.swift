//
//  PhotoGridDelegate.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import UIKit

protocol PhotoGridSelectionDelegate: AnyObject {
    func didSelectPhoto(atIndex index: Int)
    func didLongPressPhoto(atIndex index: Int)
}

class PhotoGridDelegate: NSObject, UICollectionViewDelegate {
    
    private weak var photoSelectionDelegate : PhotoGridSelectionDelegate?
    
    init(photoSelectionDelegate : PhotoGridSelectionDelegate) {
        self.photoSelectionDelegate = photoSelectionDelegate
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.photoSelectionDelegate?.didLongPressPhoto(atIndex: indexPath.row)
    }
}
