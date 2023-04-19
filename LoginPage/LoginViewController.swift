//
//  LoginViewController.swift
//  LoginPage
//
//  Created by Gaurisha gupta on 11/02/23.
//

import UIKit
import NVActivityIndicatorView

class LoginViewController: UIViewController {

    @IBOutlet weak var smallActiveView: NVActivityIndicatorView!
   
    @IBOutlet weak var activeView: UIView!
    @IBOutlet weak var lbuser: UILabel!
    @IBOutlet weak var usertext: UITextField!
    @IBOutlet weak var lbpass: UILabel!
    @IBOutlet weak var passtext: UITextField!
    var userVaild:Bool!
    var passVaild:Bool!
    var apiData:LoginViewModel = LoginViewModel()
    var animating:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpTap(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as!ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func isValid(testStr:String) -> Bool {
        guard testStr.count > 7, testStr.count < 18 else { return false }

        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: testStr)
    }
    func isValidPassword(datastr:String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: datastr)
    }
  
    
    @IBAction func logintap(_ sender: Any) {
        if userVaild == true && passVaild == true {
            smallActiveView.startAnimating()
            apiData.postapi()
//            apiData.LoginApi { dict, result in
//                if result == true {
//                   let user = UserDefaults.standard
//                    user.set(true, forKey: "isLogin")
//                    user.set(dict["userId"], forKey: "userId")
//                    user.set(dict["userName"], forKey: "userName")
//                    print(user.value(forKey: "userId"))
//                   
//                    DispatchQueue.main.async {
//                        self.smallActiveView.stopAnimating()
//                        self.activeView.isHidden = true
//                        self.performSegue(withIdentifier: "nextPass", sender: nil)
//                    }
//                    
//                }else{
//                    self.smallActiveView.stopAnimating()
//                    self.activeView.isHidden = true
//                    
//                   
//                }
//            }
         //   performSegue(withIdentifier: "nextPass", sender: nil)
        }else{
           
            self.userVaild = false
            self.passVaild = false
        }
    }
    
}
extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField   == usertext {
            if (usertext.text != nil)  && isValid(testStr: usertext.text!){
                self.userVaild = true
                print("is userVaild")
            }else{
                self.userVaild = false
                print("is not userVaild")
            }
        }else{
            if (passtext.text != nil) && isValidPassword(datastr: passtext.text!){
                self.passVaild = true
               print("is passVaild")
            }else{
                self.passVaild = false
                print("is not passVaild")
            }
         
        }
        return true
}

    }
    
    

