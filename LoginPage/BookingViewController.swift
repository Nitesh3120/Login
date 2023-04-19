//
//  BookingViewController.swift
//  LoginPage
//
//  Created by Gaurisha gupta on 13/04/23.
//

import UIKit

class BookingViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textroomfee: UITextField!
    @IBOutlet weak var textcreateroom: UITextField!
    @IBOutlet weak var textavailableto: UITextField!
    @IBOutlet weak var textavailablefrom: UITextField!
    @IBOutlet weak var textenterenddate: UITextField!
   
    @IBOutlet weak var textenterdate: UITextField!
    @IBOutlet weak var bookingbtn: UIButton!
    private lazy var datePicker: UIDatePicker = {
      let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
      datePicker.timeZone = TimeZone.current
//        datePicker.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) {
            if #available(iOS 14.0, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
      return datePicker
    }()
    private lazy var date: UIDatePicker = {
      let datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
      datePicker.timeZone = TimeZone.current
//        datePicker.datePickerMode = .dateAndTime
        if #available(iOS 13.4, *) {
            if #available(iOS 14.0, *) {
                datePicker.preferredDatePickerStyle = .wheels
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
      return datePicker
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        textenterdate .inputView = datePicker
  
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        
    textavailableto .inputView = date
        date.addTarget(self, action: #selector(DatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let date: Date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateStr = dateFormatter.string(from: date)
        textenterdate.text = dateStr
     }
    @objc func DatePicker(sender: UIDatePicker) {
        let date: Date = date.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateStr = dateFormatter.string(from: date)
        textavailableto.text = dateStr
     }
    

  
    
    @IBAction func bookingclick(_ sender: Any) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textcreateroom.resignFirstResponder()
        textroomfee.resignFirstResponder()
        textavailableto.resignFirstResponder()
        textavailablefrom.resignFirstResponder()
        textenterenddate.resignFirstResponder()
        textenterdate.resignFirstResponder()
        return true;
    }
    
   
    
    func keyboardreturn(){
        textcreateroom.resignFirstResponder()
        textroomfee.resignFirstResponder()
        textavailableto.resignFirstResponder()
        textavailablefrom.resignFirstResponder()
        textenterenddate.resignFirstResponder()
        textenterdate.resignFirstResponder()
    }
    
    @IBAction func tapgesture(_ sender: Any) {
       keyboardreturn()
       
    }
}

