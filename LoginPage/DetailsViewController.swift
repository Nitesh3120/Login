//
//  DetailsViewController.swift
//  LoginPage
//
//  Created by Nitesh Garg on 30/03/23.
//

import UIKit
import NVActivityIndicatorView

class DetailsViewController: UIViewController {
    var getDataModel:ViewModel = ViewModel()
    var arr2:[DataDict] = [DataDict]()
    var passdataarr:[String:AnyObject]!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var smallmainView: NVActivityIndicatorView!
    
    @IBOutlet weak var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smallmainView.startAnimating()
        getDataModel.passData { Data2, Select in
           
            DispatchQueue.main.async {
                
                self.arr2 = Data2
                self.smallmainView.stopAnimating()
                self.mainView.isHidden = true
                self.table.reloadData()
            }
           
        }

        
    }
    

    
}
extension DetailsViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCellPass", for: indexPath) as! DetailsTableViewCell
        cell.getdata(data: arr2[indexPath.row] )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.passdataarr = arr2[indexPath.row]
    }
    
    
}
