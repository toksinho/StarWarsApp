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
 
    //This is one solution for endless(infinite) scroll, other solution is to use scrollViewDidScroll(_ scrollView: UIScrollView)
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //only download data if "next" is not null
        if let urlLink = JSON.webUrlForNextCharacters {
            
            //download data when user goes down to view(screen)
            if indexPath.row == charactersArray.count-1 {
                network.fetchCharacterData(urlLink: urlLink)  {
                    (dataResult) -> Void in
                    switch dataResult {
                    case let .success(characters):
                        self.charactersArray.append(contentsOf: characters)  //append to array so we have all data in table
                    case let .failure(error):
                        print("Error fetching characters: \(error)")
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: indexPath)
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetails" {
            if let indexPath = sender as? IndexPath {
                let character = charactersArray[indexPath.row]
                if let showDetailsVC = segue.destination as? ShowDetailsVC {
                    showDetailsVC.character = character
                    showDetailsVC.indexOfArray = indexPath.row
                }
            }
        }
        }
    }





















