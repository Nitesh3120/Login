//
//  LoginViewModel.swift
//  LoginPage
//
//  Created by Nitesh Garg on 22/03/23.
//

import Foundation

struct ResponseData: Codable {
    let user_id: Int?
    let first_name: String?
    let last_name: String?
    let email: String?
    let status: String?
    let session_id: String?
    let wallet_amount: String?
    let token: String?
    let testFormdata: SendData
    let msg: String?
}
struct SendData: Codable{
    let email_mobile: String?
    let password: String?
}


struct RequestData: Codable{
    let email_mobile: String?
    let password: String?
}



class LoginViewModel {
    init (){
        
    }
    
    func postapi(){
        let url = URL(string: "https://mangotv.co.in/api/login")
        guard let stringUrl = url else{
            return
        }
        var request = URLRequest(url: stringUrl)
        request.httpMethod = "POST"
//        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(postLength, forHTTPHeaderField:"Content-Length")
        request.setValue("application/json", forHTTPHeaderField:"Accept")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type")
        request.allHTTPHeaderFields = ["Accept": "application/json", "Content-Type": "multipart/form-data; boundary=<calculated when request is sent>"]
        let reqObject: RequestData = RequestData(email_mobile: "8377990404", password: "123456")
        do {
            // prepare json data
            let json: [String: Any] = ["email_mobile": "8377990404",
                                       "password": "123456"]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)

            request.httpBody = jsonData
        } catch {
            print("error")
        }
       let obj = URLSession.shared.dataTask(with: request) {  data, response, error in
            if error == nil {
                do {
                    var obj:ResponseData  = try JSONDecoder().decode(ResponseData.self, from: data!)
                    print(obj)
                  
                } catch let error {
                    print(error)
                }
                
                print(data)
                print(response)
                print(error)
            } else {
                print(error)
            }
          
        }
        
        obj.resume()
    }
    
    
//    func LoginApi(block:@escaping(_ dict:[String:AnyObject], _ result:Bool) -> Void){
//        var urlString  = "https://5c26c4e0-7003-44a4-ba4a-beb350fe878e.mock.pstmn.io/login"
//        let url  = URL(string: urlString)
//        guard let dataUrl = url else{
//            return
//        }
//        var request = URLRequest(url: dataUrl)
//        URLSession.shared.dataTask(with: request) { [self] data, response, error in
//
//            if error != nil{
//                //Show Error
//
//                print(error)
//            } else{
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data!) as! [String: AnyObject]
//                    var getKey = json["status"]
//                    if getKey as! String == "SUCCESS"{
//                        print(json)
//                        block(json, true)
//                    } else{
//                        block([:], false)
//                    }
//
//                } catch {
//                   print(error)
//                }
//            }
//        }
//        .resume()
//    }
}
