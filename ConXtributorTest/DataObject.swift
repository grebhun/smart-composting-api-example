//
//  DataObject.swift
//  ConXtributorTest
//
//  Created by Graham Rebhun on 9/9/20.
//  Copyright © 2020 Graham Rebhun. All rights reserved.
//

import Foundation

struct ResponseObject:Decodable {
    var channel:Channel
    var feeds:[FeedDetail]
}

struct Channel:Decodable {
    var id:Int?
    var name:String?
    var description:String?
    var latitude:String?
    var longitude:String?
    var field1:String?
    var field2:String?
    var field3:String?
    var created_at:String?
    var updated_at:String?
    var last_entry_id:Int?
}

struct FeedDetail:Decodable {
    var created_at:String?
    var entry_id:Int?
    var field1:String?
    var field2:String?
    var field3:String?
}
