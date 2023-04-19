//
//  DataCollectionViewCell.swift
//  LoginPage
//
//  Created by Nitesh Garg on 17/03/23.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    func getData(get: [String:AnyObject]) {
        lb.text = get["name"] as! String
        let url = URL(string: get["profile"] as! String)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.img.image = UIImage(data: data!)
            }
        }
    }
   
}

