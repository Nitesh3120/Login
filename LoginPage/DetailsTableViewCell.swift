//
//  DetailsTableViewCell.swift
//  LoginPage
//
//  Created by Nitesh Garg on 30/03/23.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var lbData: UILabel!
    
    @IBOutlet weak var lbdetails: UILabel!
    @IBOutlet weak var imgSign: UIImageView!
    @IBOutlet weak var lbProcess: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var superImg: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func getdata(data:DataDict){
        lbData.text = data.id
        lbName.text  = data.name
        lbProcess.text = data.productBrand
        lbDate.text = String(data.units.amount)
        lbdetails.text = "Go Live "
        let url = URL(string: data.webIcon)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.superImg.image = UIImage(data: data!)
            }
        }
        
    }

}
