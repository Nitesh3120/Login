//
//  PassDataViewController.swift
//  LoginPage
//
//  Created by Nitesh Garg on 20/03/23.
//

import UIKit

class PassDataViewController: UIViewController {
    var getCellData:[String:AnyObject] = [String:AnyObject]()
    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lb.text = getCellData ["name"] as! String
        let url = URL(string: getCellData["profile"] as! String)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.img.image = UIImage(data: data!)
            }
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func clickbtn(_ sender: Any) {
        performSegue(withIdentifier: "passDetailsScreen", sender: nil)
    }
    

    

}
