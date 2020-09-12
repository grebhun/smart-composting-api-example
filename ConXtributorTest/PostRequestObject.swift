//
//  PostRequest.swift
//  ConXtributorTest
//
//  Created by Graham Rebhun on 9/12/20.
//  Copyright © 2020 Graham Rebhun. All rights reserved.
//

import Foundation

class PostRequestObject:Codable {
    var api_key: String
    var field1: String?
    var field2: String?
    var field3: String?
    
    init(field1: String, field2: String, field3: String) {
        self.api_key = ""
        self.field1 = field1
        self.field2 = field2
        self.field3 = field3
    }
}

struct PostResponse:Decodable {
    var channel_id: Int?
    var field1:String?
    var field2:String?
    var field3:String?
    var created_at:String?
    var entry_id:Int?
    var status:String?
    var latitude:String?
    var longitude:String?
    var elevation:String?
}
