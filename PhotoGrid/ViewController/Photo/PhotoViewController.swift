//
//  PhotoViewController.swift
//  PhotoGrid
//
//  Created by Ankit Angra on 2022-04-25.
//

import UIKit

class PhotoViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = photoGridDelegate
            collectionView.dataSource = photoGridDatasource
            collectionView.register(PhotoGridCell.fromXib(), forCellWithReuseIdentifier: PhotoGridCell.identifier)
        }
    }
    
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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        
    }
    
    @objc func didTapAddButton() {
        photoViewModel.insert(image: UIImage(named: "pika")!)
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
