//
//  Service.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation
import Alamofire


class Service: Any {
    
    let baseApiUrl : String = "https://reqres.in/api/"
    func get(_ url: String, parameters: Parameters? = nil, completion: @escaping (Data?, Error?) -> Void) {
       AF.request(url,method: .get, parameters: parameters, headers: nil).validate().responseData { response in
         switch response.result {
         case .success(let value):
           completion(value, nil)
         case .failure(let error):
           if let statusCode = response.response?.statusCode, let data = response.data {
             #if DEBUG
             debugPrint("ERROR STATUS CODE \(statusCode) of \(url)")
             #endif

             if statusCode == 429 {
               completion(nil, error)
               return
             }
             
             do {
//                let decodedData = try JSONDecoder().decode("ErrorRequestModel.self", from: data)
               completion(nil, NSError(domain: "", code: statusCode, userInfo: [
                 NSLocalizedDescriptionKey:  "self.getErrMessage(msg: decodedData.message)"
               ]))
             } catch {
               completion(nil, error)
             }
           } else {
             completion(nil, error)
           }
         }
       }
     }
}
