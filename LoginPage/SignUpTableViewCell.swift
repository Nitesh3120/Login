//
//  SignUpTableViewCell.swift
//  LoginPage
//
//  Created by Gaurisha gupta on 11/02/23.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

    var fetchdata:ModelClass!
    var index: Int!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var lb: UILabel!
    @IBOutlet weak var lberror: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func isValid(testStr:String) -> Bool {
        guard testStr.count > 5, testStr.count < 18 else { return false }

        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: testStr)
    }
    
    func validateEmail(_ emailStr: String) -> Bool {
        let regEx = "[A-Z0-9a-z._%+]+@[A-Za-z0-9.]+\\.[A-Za-z]{2,4}"
        let validationStatus = NSPredicate(format:"SELF MATCHES %@", regEx)
        return  validationStatus.evaluate(with: emailStr)
    }
    
    public func isValidPassword(passStr: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let validationStatus = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return  validationStatus.evaluate(with: passStr)
    }
}



extension SignUpTableViewCell: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if self.index == 0 || self.index == 1 {
            var data =  isValid(testStr: textField.text!)
            if data {
                lberror.isHidden = true
            }else{
                lberror.isHidden = false
                lberror.text = "name is not valid"
            }
        } else if  self.index == 2 {
            var userName =  validateEmail(textField.text!)
            if userName{
                lberror.isHidden = true
            }else{
                lberror.isHidden = false
                lberror.text = "user name is not valid"
            }
        } else if self.index == 3 || self.index  == 4 {
            self.textfield.isSecureTextEntry = true;
            var pass = isValidPassword(passStr: textField.text!)
            if pass{
                lberror.isHidden = true
               
            } else{
                lberror.isHidden = false
                lberror.text = "Password is not valid"
            }
                
        }
        return true
    }
}

