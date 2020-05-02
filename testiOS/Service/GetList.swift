//
//  GetList.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation

class GetList: Service {
    static let shared =  GetList()
    
    func getListData(completion: @escaping (Data?, Error?) -> Void) {
        let url = baseApiUrl + "users"
        get(url) { (result, error) in
            completion(result, error)
        }
    }
}
