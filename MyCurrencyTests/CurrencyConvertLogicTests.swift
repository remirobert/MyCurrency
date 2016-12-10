//
//  CurrencyConvertLogicTests.swift
//  MyCurrency
//
//  Created by Remi Robert on 09/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import XCTest

class CurrencyConvertLogicTests: XCTestCase {
    
    private lazy var graph: CurrencyGraph = {
        let graph = CurrencyGraph()
        graph.addRate(from: .EUR, to: .AUD, for: 0.3)
        return graph
    }()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func valueFrom(result: ResultConversion) -> Double? {
        switch result {
        case .notFound:
            return nil
        case .value(let v):
            return v
        }
    }
    
    func testSuccessConvert() {
        let result = Currency.EUR.convert(to: .AUD, value: 5, graph: graph)
        let value = valueFrom(result: result)
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 1.5)
    }
    
    func testConvertSameCurrency() {
        let result = Currency.EUR.convert(to: .EUR, value: 5, graph: graph)
        let value = valueFrom(result: result)
        XCTAssertNotNil(value)
        XCTAssertEqual(value, 5)
    }
    
    func testNotFoundConvert() {
        let result = Currency.EUR.convert(to: .JPY, value: 5, graph: graph)
        let value = valueFrom(result: result)
        XCTAssertNil(value)
    }
}
