//
//  ListModel.swift
//  testiOS
//
//  Created by andyptra on 5/1/20.
//  Copyright © 2020 andyptra. All rights reserved.
//

import Foundation
struct GetUserModel: Codable {
    let data: [GetDataUserModel]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
struct GetDataUserModel: Codable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case email = "email"
        case first_name = "first_name"
        case last_name = "last_name"
        case avatar = "avatar"
    }
}
