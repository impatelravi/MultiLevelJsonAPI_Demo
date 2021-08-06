//
//  ViewController.swift
//  MultiLvlJsonAPIDemo
//
//  Created by Ravi Patel on 02/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func btnTblView(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "TableView", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewViewController") as! TableViewViewController
        //self.present(nextViewController, animated:true, completion:nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnTblViewJson(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "TableViewJson", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TableViewJsonViewController") as! TableViewJsonViewController
        //self.present(nextViewController, animated:true, completion:nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnColView(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "CollectionView", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CollectionViewViewController") as! CollectionViewViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
