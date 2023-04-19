//
//  ViewControllerViewmodel.swift
//  LoginPage
//
//  Created by Nitesh Garg on 20/02/23.
//

import Foundation

class ViewControllerViewmodel {
    
    init() {
        
    }
    
    func getArrayData() -> [ModelClass] {
        var obj1 = ModelClass(title: "First Name", placeHolder: "First Name", errorMsg: "",errorMsgShow: true)
        var obj2 = ModelClass(title: "Last Name", placeHolder: "Last Name", errorMsg: "")
        var obj3 = ModelClass(title: "UseerName", placeHolder: "UseerName", errorMsg: "",errorMsgShow: true)
        var obj4 = ModelClass(title: "Password", placeHolder: "Password", errorMsg: "")
        var obj5 = ModelClass(title: "Confirm Password", placeHolder: "Confirm Password", errorMsg: "")
        var obj6 = ModelClass(title: "Address", placeHolder: "Address", errorMsg: "")
        var dataObject = [obj1,obj2,obj3,obj4,obj5,obj6]
        return dataObject
    }
    func apiHit(completion: @escaping (_ data:[AnyObject],_ select:Bool) -> Void){
        let urlString = "https://mindmyscape.localserverpro.com/api/doctor/therapies"
        let url  = URL(string: urlString)
        guard let dataUrl = url else{
            return
        }
        var request = URLRequest(url: dataUrl)
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
           
            if error != nil{
                //Show Error
                print(error)
            } else{
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! [String: AnyObject]
                  var fetchdata =  json["data"]
                    print(fetchdata)
                    
                        if (json["success"] != nil)  != false{
                            completion(fetchdata as! [AnyObject], true)
                        } else{
                            completion([], false)
                        }
                } catch {
                   print(error)
                }
            }
        }
        .resume()
    }
}

