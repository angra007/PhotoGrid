//
//  PhotoViewModel.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import Foundation
import UIKit

protocol PhotoViewModelDelegate: class {
    func didInsertPhoto(atIndex index:Int)
}

class PhotoViewModel: BaseViewModel {

    private var photos = [Photo]()
    private weak var delegate: PhotoViewModelDelegate?
    
    init(delegate: PhotoViewModelDelegate) {
        self.delegate = delegate
    }
    
    func numberOfPhotographs() -> Int {
        return photos.count
    }
    
    func photograph(atIndex index: Int) -> Photo {
        return photos[index]
    }
    
    func insert(image: UIImage) {
        let id = UUID.init().uuidString
        let photo = Photo.init(id: id, image: image)
        photos.append(photo)
        self.delegate?.didInsertPhoto(atIndex: photos.count)
    }
    
    func getPhotograph(withId id: String) -> Any {
        return NSObject()
    }
    
    func delete(withId id: String) {
        
    }
}
