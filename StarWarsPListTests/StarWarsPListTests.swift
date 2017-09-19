//
//  StarWarsPListTests.swift
//  StarWarsPListTests
//
//  Created by Ivica Tokic on 19/09/2017.
//  Copyright © 2017 Ivica Tokic. All rights reserved.
//

import XCTest
@testable import StarWarsCharacters

class StarWarsPListTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFirstWebDataHasExpectedValue() {
        
        let firstWebData = PLIstHelper.getWebUrl(0)
        
        XCTAssertEqual(firstWebData, "http://starwars.wikia.com/wiki/Luke_Skywalker/Legends", "First web data is not as expected")
    }
    
    func testTenthWebDataHasExpectedValue() {
        
        let tenthWebData = PLIstHelper.getWebUrl(9)
        
        XCTAssertEqual(tenthWebData, "http://disney.wikia.com/wiki/Obi-Wan_Kenobi", "Tenth web data is not as expected")
    }
    
    func testLastWebDataHasExpectedValue() {
        
        let lastWebData = PLIstHelper.getWebUrl(29)
        
        XCTAssertEqual(lastWebData, "http://disney.wikia.com/wiki/Nien_Nunb", "Last web data is not as expected")
    }
}
