//
//  TableViewJsonViewController.swift
//  MultiLvlJsonAPIColViewDemo
//
//  Created by Ravi Patel on 06/08/21.
//

import UIKit

class TableViewJsonViewController: UIViewController {
    //UserInterface
    //TableViews
    @IBOutlet weak var tblView: UITableView!
    
    //variables
    var tableViewJsonDelegateDataSource: TableViewJsonDelegateDataSource!
    var tableViewJsonWebServiceModel = TableViewJsonWebServiceModel()
    var dictData : [CollectionViewResultModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTblView()
        // Do any additional setup after loading the view.
    }
    
    private func setupData() {
        let dictJson = readJsonFile(ofName: "JsonData")
        if let arrJson = dictJson["results"] as? [Dictionary] {
            dictData = arrJson.map({CollectionViewResultModel(dict: $0)})
        }
    }

    func setupTblView() {
        if tableViewJsonDelegateDataSource != nil {
            tableViewJsonDelegateDataSource.reloadData(arrData: dictData)
        } else {
            tableViewJsonDelegateDataSource = TableViewJsonDelegateDataSource(arrData: dictData, tbl: tblView)
        }
    }
}
