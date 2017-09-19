//
//  Character.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 15/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import Foundation


class Character {
    
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    
    init(name: String, height: String, mass: String, hair_color: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.hair_color = hair_color
    }
}
