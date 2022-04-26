//
//  PhotoGridDatasource.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import UIKit

class PhotoGridDatasource: NSObject, UICollectionViewDataSource {
    
    private weak var photoSelectionDelegate : PhotoGridSelectionDelegate?
    private var photoViewModel : PhotoViewModel
    
    init(photoSelectionDelegate : PhotoGridSelectionDelegate, photoViewModel : PhotoViewModel) {
        self.photoSelectionDelegate = photoSelectionDelegate
        self.photoViewModel = photoViewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoViewModel.numberOfPhotographs()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoGridCell.identifier, for: indexPath) as? PhotoGridCell else {
            fatalError()
        }
        let photo = photoViewModel.photograph(atIndex: indexPath.row)
        cell.bind(photo: photo)
        return cell
    }
}

