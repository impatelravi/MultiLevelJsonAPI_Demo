//
//  CollectionViewViewController.swift
//  MultiLvlJsonAPIDemo
//
//  Created by Ravi Patel on 02/08/21.
//

import UIKit
import NotificationCenter

class CollectionViewViewController: UIViewController {
    //UserInterface
    //CollectionView
    @IBOutlet weak var colView: UICollectionView!
    @IBOutlet weak var mainView: UIView!
    
    //Variables
    var width: CGFloat = 0
    var dictData: [CollectionViewResultModel] = []
    var collectionViewWebService = CollectionViewWebService()
    var collectionViewDelegateDatasource: CollectionViewDelegateDatasource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = (mainView.frame.width / 3)
        getData()
        

    }
    
    func setupColView() {
        if collectionViewDelegateDatasource != nil {
            collectionViewDelegateDatasource.reloadColView(arrContent: dictData)
            
        } else {
            collectionViewDelegateDatasource = CollectionViewDelegateDatasource(arrContent: dictData, colViewContent: colView, delegateContent: self)
        }
    }
}

extension CollectionViewViewController {
    func getData() {
        collectionViewWebService.getData { (response) in
            self.dictData = response!.results
            self.setupColView()
            //print(self.dictData.map({ $0.results }))
        }
    }
}

extension CollectionViewViewController: ColViewDelegate {
    func colViewDidSelectCell(collectionView: UICollectionView, atIndexPath: IndexPath) {
        print("Collection Cell at Index:\(atIndexPath) Tapped")
    }
}
