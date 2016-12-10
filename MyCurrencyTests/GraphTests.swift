//
//  GraphTest.swift
//  MyCurrency
//
//  Created by Remi Robert on 09/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import XCTest

class GraphTest: XCTestCase {
    
    private lazy var graph: CurrencyGraph = {
        let graph = CurrencyGraph()
        graph.addRate(from: .EUR, to: .AUD, for: 0.3)
        graph.addRate(from: .AUD, to: .CHF, for: 1.8)
        graph.addRate(from: .AUD, to: .JPY, for: 7.3)
        return graph
    }()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAdd() {
        XCTAssertEqual(graph.vertex.count, Currency.all().count)
    }
    
    func testFindPathExist1() {
        let path = graph.findPath(from: .EUR, to: .JPY)
        XCTAssertNotNil(path)
        XCTAssertEqual(path!.count, 2)
    }

    func testFindPathExist2() {
        let path = graph.findPath(from: .EUR, to: .AUD)
        XCTAssertNotNil(path)
        XCTAssertEqual(path!.count, 1)
    }
    
    func testFindPathExistSameCurrency() {
        let path = graph.findPath(from: .EUR, to: .EUR)
        XCTAssertNotNil(path)
        XCTAssertEqual(path!.count, 0)
    }
    
    func testFindPathNotExist() {
        let path = graph.findPath(from: .EUR, to: .USD)
        XCTAssertNil(path)
    }
}
