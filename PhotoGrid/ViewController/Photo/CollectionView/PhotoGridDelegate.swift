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
        let noOfCellsInRow = 3
        let width = (collectionView.frame.width - 2) / CGFloat (noOfCellsInRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
