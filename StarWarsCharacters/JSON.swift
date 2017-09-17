//
//  JSON.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 15/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import Foundation

enum DataError: Error {
    case invalidJSONData
}

struct JSON {
    
    static var webUrlForNextCharacters: String?
    
    static func characters(fromJSON data: Data) -> DataResult {
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data,
                                                              options: [])
            guard
                let jsonDictionary = jsonObject as? [String: Any],
                let results = jsonDictionary["results"] as? [[String: Any]]
            
                
                else {
                    return .failure(DataError.invalidJSONData)
            }
            
            //need this because some data is null
            if let next = jsonDictionary["next"] as? String {
                nextCharacters(fromJSON: next)
            } else {
                nextCharacters(fromJSON: nil)
            }
            var arrayOfCharacters = [Character]()
            for dataJSON in results {
                if let data = character(fromJSON: dataJSON) {
                    arrayOfCharacters.append(data)
                }
            }
            if arrayOfCharacters.isEmpty && !results.isEmpty {
                return .failure(DataError.invalidJSONData)
            }
            
            
            
            return .success(arrayOfCharacters)
        } catch let error {
            return .failure(error)
        }
    }
    
    
    private static func character(fromJSON json: [String : Any]) -> Character? {
        
        guard
            let name = json["name"] as? String,
            let height = json["height"] as? String,
            let mass = json["mass"] as? String,
            let hair_color = json["hair_color"] as? String
            
            else {
                return nil
        }
        
        return Character(name: name, height: height, mass: mass, hair_color: hair_color)
    }
    
    
    private static func nextCharacters(fromJSON nextUrl: String?) {
        
        if let url = nextUrl {
            webUrlForNextCharacters = url
        } else {
            webUrlForNextCharacters = nil
        }
    
    }

}
    

