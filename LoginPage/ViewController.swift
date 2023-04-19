//
//  ViewController.swift
//  LoginPage
//
//  Created by Gaurisha gupta on 11/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    var viewModel: ViewControllerViewmodel = ViewControllerViewmodel()
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.layer.cornerRadius = imgView.frame.size.height/2
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func registration(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as!LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginBtnTap(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var data: [ModelClass] = viewModel.getArrayData()
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SignUpTableViewCell
        var getData: [ModelClass] = viewModel.getArrayData()
        var fetchdata = getData[indexPath.row]
        cell.index = indexPath.row
        cell.lb.text = fetchdata.title
        cell.textfield.placeholder = fetchdata.placeHolder
         return cell
    }
}

