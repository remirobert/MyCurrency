//
//  CurrencyModelTests.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import XCTest

class CurrencyModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testErrorWithWrongCurrencyName() {
        let json = [
            "to": "OUI",
            "from": "EUR",
            "rate": 0
        ] as [String : Any]
        
        let model = CurrencyModel(json: json as [String : AnyObject])
        XCTAssertNil(model)
    }
    
    func testErrorWithWrongCurrencyName2() {
        let json = [
            "to": "EUR",
            "from": "NON",
            "rate": 0
            ] as [String : Any]
        
        let model = CurrencyModel(json: json as [String : AnyObject])
        XCTAssertNil(model)
    }
    
    func testErrorWithWrongKeys() {
        let json = [
            "from1": "EUR",
            "to": "USD",
            "rate1": 1.09833
        ] as [String : Any]
        
        let model = CurrencyModel(json: json as [String : AnyObject])
        XCTAssertNil(model)
    }
    
    func testErrorWithWrongKeys2() {
        let json = [
            "from": "EUR",
            "to1": "USD",
            "rate1": 1.09833
            ] as [String : Any]
        
        let model = CurrencyModel(json: json as [String : AnyObject])
        XCTAssertNil(model)
    }
    
    func testErrorWithWrongRate() {
        let json = [
            "from": "EUR",
            "to": "USD",
            "rate": "089"
            ] as [String : Any]
        
        let model = CurrencyModel(json: json as [String : AnyObject])
        XCTAssertNil(model)
    }

    func testParseSuccess() {
        let json = [
            "from": "EUR",
            "to": "USD",
            "rate": 1.09833
            ] as [String : Any]
        
        let model = CurrencyModel(json: json as [String : AnyObject])
        XCTAssertNotNil(model)
    }
}
