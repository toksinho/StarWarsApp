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
    @IBOutlet weak var moreDataButton: UIButton!

    var character: Character!
    var indexOfArray: Int = 0
    
    @IBAction func showWebView(_ sender: Any) {
        
        performSegue(withIdentifier: "showWebView", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreDataButton.layer.cornerRadius = 10
        moreDataButton.clipsToBounds = true
        
        nameLabel.text = character.name
        
        heightValue.isUserInteractionEnabled = false
        heightValue.text = character.height
        
        massValue.isUserInteractionEnabled = false
        massValue.text = character.mass
        
        hairColorValue.isUserInteractionEnabled = false
        hairColorValue.text = character.hair_color
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showWebView" {
            if let webViewVC = segue.destination as? WebViewVC {
                webViewVC.urlWebView = PLIstHelper.getWebUrl(indexOfArray)
            }
            
        }
    }
 

}
