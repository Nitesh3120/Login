//
//  DataViewController.swift
//  LoginPage
//
//  Created by Nitesh Garg on 17/03/23.
//

import UIKit
import NVActivityIndicatorView

class DataViewController: UIViewController {
    @IBOutlet weak var mainactiveDataview: UIView!
    var dataModel: ViewControllerViewmodel = ViewControllerViewmodel()
    @IBOutlet weak var activeDataview: NVActivityIndicatorView!
    var arr:[AnyObject] = [AnyObject]()
    var passData:[String:AnyObject]!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activeDataview.startAnimating()
        
        dataModel.apiHit { [self] Data1, Select in
            DispatchQueue.main.async {
                self.arr = Data1
                 activeDataview.stopAnimating()
                mainactiveDataview.isHidden = true
//                activeDataview.stopAnimating()
                self.collectionView.reloadData()
              
               
            }
            
            
        }

        // Do any additional setup after loading the view.
    }
    

    
}
extension DataViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataPass", for: indexPath) as! DataCollectionViewCell
        cell.getData(get: arr[indexPath.row] as! [String : AnyObject])
        return cell
    }
    
    
}

extension DataViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeHeight = (collectionView.bounds.width)/3
        let sizeWidth = (collectionView.bounds.width)/3 - 10
        print(sizeWidth)
        print(sizeHeight)
        return CGSize(width: sizeWidth, height: sizeHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.passData = arr[indexPath.row] as! [String : AnyObject]
        performSegue(withIdentifier: "getData", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getData" {
        let destination:PassDataViewController  = segue.destination as!PassDataViewController
            destination.getCellData = self.passData
            
      }
    }
}
