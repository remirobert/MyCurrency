//
//  CurrencyGraph.swift
//  MyCurrency
//
//  Created by Remi Robert on 07/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class CurrencyGraph {
    
    static let sharedGraph = CurrencyGraph()
    var vertex = [CurrencyVertex]()
    fileprivate var pathCurrency: [RateEdge]?
    
    init() {
        self.vertex = Currency.all().map {
            return CurrencyVertex(currency: $0)
        }
    }
    
    func addRate(from: Currency, to: Currency, for rate: Double) {
        let currencyFrom = self.vertex.filter({ $0.currency == from }).first!
        let currencyTo = self.vertex.filter({ $0.currency == to }).first!
        let edge = RateEdge(from: currencyFrom, to: currencyTo, for: rate)
        currencyFrom.edges.append(edge)
    }    
}

extension CurrencyGraph {
    
    private func getPath(current: CurrencyVertex, to: Currency, path: [RateEdge]) {
        if current.currency == to {
            self.pathCurrency = path
            return
        }
        if current.edges.count == 0 {
            return
        }
        for edge in current.edges {
            var currentPath = path
            currentPath.append(edge)
            getPath(current: edge.to, to: to, path: currentPath)
        }
    }
    
    func findPath(from: Currency, to: Currency) -> [RateEdge]? {
        let currencyFrom = self.vertex.filter({ $0.currency == from }).first!
        self.pathCurrency = nil
        getPath(current: currencyFrom, to: to, path: [])
        return self.pathCurrency
    }
}
