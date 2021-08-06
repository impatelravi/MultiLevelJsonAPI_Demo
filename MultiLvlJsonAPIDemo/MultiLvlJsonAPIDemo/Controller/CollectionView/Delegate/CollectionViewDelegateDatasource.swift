//
//  CollectionViewDelegateDatasource.swift
//  MultiLvlJsonAPIDemo
//
//  Created by Ravi Patel on 03/08/21.
//

import UIKit

@objc protocol ColViewDelegate {
    @objc optional func colViewDidSelectCell(collectionView: UICollectionView, atIndexPath: IndexPath)
}

class CollectionViewDelegateDatasource: NSObject {
    //MARK:- Variable
    fileprivate var arrSourceContent: [CollectionViewResultModel] = []
    fileprivate weak var colViewContent: UICollectionView?
    weak var delegateContent: ColViewDelegate?
    
    //MARK:- Initializer
    init(arrContent: [CollectionViewResultModel], colViewContent: UICollectionView, delegateContent: ColViewDelegate) {
        self.arrSourceContent = arrContent
        self.colViewContent = colViewContent
        self.delegateContent = delegateContent
        super.init()
        
        setup()
    }
    
    //MARK:- Custom Methods
    //Set Up
    fileprivate func setup() {
        registerCell()
        
        colViewContent?.delegate = self
        colViewContent?.dataSource = self
    }
    
    //Register cells
    fileprivate func registerCell() {
        colViewContent?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

    }
    
    //MARK:- Public Methods
    func reloadColView(arrContent: [CollectionViewResultModel]) {
        arrSourceContent = arrContent
        self.colViewContent?.reloadData()
    }
}

//MARK:- UICollectionViewDataSource Methods
extension CollectionViewDelegateDatasource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSourceContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configureCell(dictData: arrSourceContent[indexPath.row])
        return cell
    }
}

//MARK:- UICollectionViewDelegate Methods
extension CollectionViewDelegateDatasource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateContent?.colViewDidSelectCell?(collectionView: collectionView, atIndexPath: indexPath)
    }
}

//MARK:- UICollectionViewDelegateFlowLayout Methods
extension CollectionViewDelegateDatasource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return sectionInset
    }
}
