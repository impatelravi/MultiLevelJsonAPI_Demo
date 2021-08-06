//
//  TableViewViewController.swift
//  MultiLvlJsonAPIColViewDemo
//
//  Created by Ravi Patel on 04/08/21.
//

import UIKit

class TableViewViewController: UIViewController {
    //UserInterface
    //TableViews
    @IBOutlet weak var tblView: UITableView!
    
    //variables
    var tableViewDelegateDataSource: TableViewDelegateDataSource!
    var tableViewWebServiceModel = TableViewWebServiceModel()
    var dictData : [CollectionViewResultModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setupTblView()
        // Do any additional setup after loading the view.
    }

    func setupTblView() {
        if tableViewDelegateDataSource != nil {
            tableViewDelegateDataSource.reloadData(arrData: dictData)
        } else {
            tableViewDelegateDataSource = TableViewDelegateDataSource(arrData: dictData, tbl: tblView)
        }
    }
}

//WebserviceCall
extension TableViewViewController {
    func getData() {
        tableViewWebServiceModel.getData { (response) in
            self.dictData = response!.results
            print(self.dictData[0].id)
            self.setupTblView()
        }
    }
}
