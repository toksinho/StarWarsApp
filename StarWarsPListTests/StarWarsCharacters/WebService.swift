//
//  WebService.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 15/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import Foundation

enum DataResult {
    case success([Character])
    case failure(Error)
}

class WebService {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private func processRequest(data: Data?, error: Error?) -> DataResult {
        
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return JSON.characters(fromJSON: jsonData)
    }
    
    func fetchCharacterData(urlLink: String, completion: @escaping (DataResult) -> Void) {
        
        guard let url = URL(string: urlLink) else {
            print("Error: cannot create URL")
            return
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processRequest(data: data, error: error)
            completion(result)
            
        }
        task.resume()
    }
}
