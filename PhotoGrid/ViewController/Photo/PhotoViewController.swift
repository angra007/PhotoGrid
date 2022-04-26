//
//  PhotoViewController.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import UIKit

class PhotoViewController: BaseViewController {
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let photoCollectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        photoCollectionView.register(PhotoGridCell.self, forCellWithReuseIdentifier: PhotoGridCell.identifier)
        photoCollectionView.backgroundColor = UIColor.white
        return photoCollectionView
    }()
    
    private lazy var photoViewModel: PhotoViewModel = {
        PhotoViewModel(delegate: self)
    }()
    
    private lazy var photoGridDelegate: PhotoGridDelegate = {
        PhotoGridDelegate(photoSelectionDelegate: self)
    }()
    
    private lazy var photoGridDatasource: PhotoGridDatasource = {
        PhotoGridDatasource(photoSelectionDelegate: self, photoViewModel: photoViewModel)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Grid"
        view.addSubview(collectionView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        collectionView.dataSource = photoGridDatasource
        collectionView.delegate = photoGridDelegate
        collectionView.frame = view.bounds
    }
    
    @objc func didTapAddButton() {
        
        let alert = UIAlertController(title: nil, message: "Please select one option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (action) in
            self.photoViewModel.insert(image: UIImage(named: "pika")!)
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            
        }))
        
        present(alert, animated: true) {
            print("Alert presented")
        }
    }

}

extension PhotoViewController : PhotoGridSelectionDelegate {
    func didSelectPhoto(atIndex index: Int) {
        
    }
    
    func didLongPressPhoto(atIndex index: Int) {
        
    }
}

extension PhotoViewController: PhotoViewModelDelegate {
    func didInsertPhoto(atIndex index: Int) {
        //let indexPath = IndexPath.init(row: index - 1, section: 0)
        self.collectionView.reloadData()
    }
}
