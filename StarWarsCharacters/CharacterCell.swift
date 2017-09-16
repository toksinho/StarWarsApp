//
//  CharacterCell.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 16/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(name: String) {
        
        characterNameLabel.text = name
    }

}
