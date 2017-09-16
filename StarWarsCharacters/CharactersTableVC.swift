//
//  CharactersTableVC.swift
//  StarWarsCharacters
//
//  Created by Ivica Tokic on 16/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import UIKit

class CharactersTableVC: UITableViewController {
    
    var network = WebService()
    var charactersArray = [Character]()
    var indexOfRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlLink = "http://swapi.co/api/people"
        
        network.fetchCharacterData(urlLink: urlLink)  {
            (dataResult) -> Void in
            switch dataResult {
            case let .success(characters):
                self.charactersArray = characters
            case let .failure(error):
                print("Error fetching characters: \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return charactersArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as? CharacterCell {
            
            let characterArrayRow = charactersArray[indexPath.row]
            
            let characterName = characterArrayRow.name
            
            cell.configureCell(name: characterName)

            return cell
            
        } else {
            return CharacterCell()
        }
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: indexPath)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            if let indexPath = sender as? IndexPath {
                let hairColor = charactersArray[indexPath.row].hair_color
                let mass = charactersArray[indexPath.row].mass
                let height = charactersArray[indexPath.row].height
                let name = charactersArray[indexPath.row].name
                if let showDetailsVC = segue.destination as? ShowDetailsVC {
                    showDetailsVC.name = name
                    showDetailsVC.height = height
                    showDetailsVC.mass = mass
                    showDetailsVC.hairColor = hairColor
                }
            }
        }
        }
    }





















