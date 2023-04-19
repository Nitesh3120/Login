//
//  DetailsViewModel.swift
//  LoginPage
//
//  Created by Nitesh Garg on 02/04/23.
//

import Foundation

struct ResponseObj: Codable {
    let success: Bool
    let data: [DataDict]
}

struct DataDict: Codable {
    var isPersonalizedOfferProduct: Bool
    var id: String
    var productBrand: String
    var units: UnitStruct
    var name: String
    var webIcon:String
    
}

struct UnitStruct: Codable {
    var type: String
    var amount: Int
}


class ViewModel {
    init() {
        
    }
    func passData(completion: @escaping (_ data:[DataDict],_ select:Bool) -> Void){
        let userId = UserDefaults.standard.value(forKey: "userId")
        guard let id = userId else {
            return
        }
        var string = "https://5c26c4e0-7003-44a4-ba4a-beb350fe878e.mock.pstmn.io/slot_history_model_api?userId=\(id)"
        let url  = URL(string: string)
        guard let dataUrl = url else{
            return
        }
        var request = URLRequest(url: dataUrl)
        URLSession.shared.dataTask(with: request) {  data, response, error in
            if error == nil {
                do {
                    var obj: ResponseObj = try JSONDecoder().decode(ResponseObj.self, from: data!)
                    print(obj)
                   if obj.success != false {
                       completion(obj.data, true)
                   }else{
                       completion([], false)
                   }
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
        .resume()
    }
}
