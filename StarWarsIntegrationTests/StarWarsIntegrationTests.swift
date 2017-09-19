//
//  StarWarsIntegrationTests.swift
//  StarWarsIntegrationTests
//
//  Created by Ivica Tokic on 19/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import XCTest
@testable import StarWarsCharacters

class StarWarsIntegrationTests: XCTestCase {
    
    var webService: WebService!
    var charactersArray = [StarWarsCharacters.Character]
    
    override func setUp() {
        super.setUp()
        webService = WebService()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLoadCharactersFromWebService() {
        
        let urlLink = "http://swapi.co/api/people"
        
        let expectation = self.expectation(description: "Data is downloaded")
        
        webService.fetchCharacterData(urlLink: urlLink)  {
            (dataResult) -> Void in
            switch dataResult {
            case let .success(characters):
                expectation.fulfill()
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
            
        }
        waitForExpectations(timeout: 3 , handler: nil)
        
    }
    
    
}
