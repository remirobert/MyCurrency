//
//  NetworkTests.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import XCTest

class NetworkTests: XCTestCase {
    
    private let network = Network()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRequestAllCurrencies() {
        var endRequest = false
        network.perform(ressource: Ressource.all()) { models in
            endRequest = true
            XCTAssertNotNil(models)
        }
        
        while (!endRequest) {
            CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 0.01, true)
        }
    }
    
    func testRequestWrongRessource() {
        var endRequest = false
        let url = "https://github.com/3lvis/Networking/blob/master/README.md"
        let ressource = Ressource(url: URL(string: url)!) { data -> [CurrencyModel]? in
            guard let data = data else { return nil }
            do {
                let jsonRoot = try JSONSerialization.jsonObject(with: data, options: [])
                guard let _ = jsonRoot as? NSDictionary else { return nil }
                return []
            }
            catch {}
            return nil
        }
        network.perform(ressource: ressource) { models in
            endRequest = true
            XCTAssertNil(models)
        }
        
        while (!endRequest) {
            CFRunLoopRunInMode(CFRunLoopMode.defaultMode, 0.01, true)
        }
    }
}
