//
//  PostRequest.swift
//  ConXtributorTest
//
//  Created by Graham Rebhun on 9/12/20.
//  Copyright © 2020 Graham Rebhun. All rights reserved.
//

import Foundation

enum PostError:Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct PostReqeust {
    let resourceUrl:URL
    let API_KEY = "FE3935OHOFOGEWG7"
    
    init() {
        let resourceString = "https://api.thingspeak.com/update.json"
        guard let resourceUrl = URL(string: resourceString) else {fatalError()}
        
        self.resourceUrl = resourceUrl
    }
    
    func send (_ fieldsToUpdate:PostRequestObject, completion: @escaping(Result<PostResponse, PostError>) -> Void) {
        do {
            var urlRequest = URLRequest(url: resourceUrl)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            fieldsToUpdate.api_key = API_KEY
            
            urlRequest.httpBody = try JSONEncoder().encode(fieldsToUpdate)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                    let jsonData = data else {
                        completion(.failure(.responseProblem))
                        return
                }
                
                do {
                    let responseData = try JSONDecoder().decode(PostResponse.self, from: jsonData)
                    completion(.success(responseData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}
