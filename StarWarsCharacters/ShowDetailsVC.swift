//
//  ShowDetailsVC.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 16/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit

class ShowDetailsVC: UIViewController {

    @IBOutlet weak var heightValue: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var massValue: UITextField!
    @IBOutlet weak var hairColorValue: UITextField!
    
    var name: String!
    var height: String!
    var hairColor: String!
    var mass: String!
    
    @IBAction func showWebView(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        
        heightValue.isUserInteractionEnabled = false
        heightValue.text = height
        
        massValue.isUserInteractionEnabled = false
        massValue.text = mass
        
        hairColorValue.isUserInteractionEnabled = false
        hairColorValue.text = hairColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
