//
//  DataRequest.swift
//  ConXtributorTest
//
//  Created by Graham Rebhun on 9/9/20.
//  Copyright © 2020 Graham Rebhun. All rights reserved.
//

import Foundation

enum DataError:Error {
    case noDataAvailable
    case cannotProcessData
}

struct DataRequest {
    let resourceUrl:URL
    let API_KEY = "Y9MC1R0C4NKOD880"
    let CHANNEL_ID = "1135880"
    
    init() {
        let resourceString = "https://api.thingspeak.com/channels/\(CHANNEL_ID)/feeds.json?api_key=\(API_KEY)"
        guard let resourceUrl = URL(string: resourceString) else {fatalError()}
        
        self.resourceUrl = resourceUrl
    }
    
    func getResponse (completion: @escaping(Result<ResponseObject, DataError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceUrl) {data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let feedResponse = try decoder.decode(ResponseObject.self, from: jsonData)
                completion(.success(feedResponse))
            }
            catch {
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
