//
//  TableViewJsonDelegateDataSource.swift
//  MultiLvlJsonAPIColViewDemo
//
//  Created by Ravi Patel on 04/08/21.
//

import UIKit

class TableViewJsonDelegateDataSource: NSObject {
    //variables
    var arrData: [CollectionViewResultModel] = []
    var tblView: UITableView
    
    //MARK:- Initializer
    init(arrData: [CollectionViewResultModel], tbl: UITableView) {
        self.arrData = arrData
        tblView = tbl
        super.init()
        setUp()
    }
    
    //MARK:- Private Methods
    fileprivate func setUp() {
        setUpTblView()
    }
    
    fileprivate func setUpTblView() {
        tblView.delegate = self
        tblView.dataSource = self
        tblView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblView.rowHeight = 150
        registerCell()
    }
    
    fileprivate func registerCell() {
        tblView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    //MARK:- Public Methods
    func reloadData(arrData: [CollectionViewResultModel]) {
        self.arrData = arrData
        tblView.reloadData()
    }
}

extension TableViewJsonDelegateDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.configureCell(dictData: arrData[indexPath.row])
        return cell
    }
    
    
}

extension TableViewJsonDelegateDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Table Cell at Index:\(indexPath) Tapped")
    }
}
