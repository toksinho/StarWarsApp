//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 13/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func ShowData(_ sender: Any) {
        let urlLink = "http://swapi.co/api/people"
        
        network.fetchCharacterData(urlLink: urlLink)  {
            (dataResult) -> Void in
            switch dataResult {
            case let .success(characters):
                self.charactersArray = characters
            case let .failure(error):
                print("Error fetching characters: \(error)")
            }
        }

    }
    var network = WebService()
    var charactersArray = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

