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

class PhotoGridDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private weak var photoSelectionDelegate : PhotoGridSelectionDelegate?
    
    init(photoSelectionDelegate : PhotoGridSelectionDelegate) {
        self.photoSelectionDelegate = photoSelectionDelegate
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.photoSelectionDelegate?.didLongPressPhoto(atIndex: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
