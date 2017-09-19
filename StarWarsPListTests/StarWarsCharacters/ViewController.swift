//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 13/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var network = WebService()
    var charactersArray = [Character]()
    
    @IBOutlet weak var showTableButton: UIButton!
    
    @IBAction func ShowData(_ sender: Any) {

        performSegue(withIdentifier: "showTable", sender: sender)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTableButton.layer.cornerRadius = 10
        showTableButton.clipsToBounds = true
    }



}

