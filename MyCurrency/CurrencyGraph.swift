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
    
        if currencyFrom.edges.filter ({ return $0.to.currency == to }).count == 0 {
            let edge = RateEdge(from: currencyFrom, to: currencyTo, for: rate)
            currencyFrom.edges.append(edge)
        }
        if currencyTo.edges.filter ({ return $0.to.currency == from }).count == 0 {
            let edge = RateEdge(from: currencyTo, to: currencyFrom, for: 1 / rate)
            currencyTo.edges.append(edge)
        }
    }
}

extension CurrencyGraph {
    
    private func getPath(current: CurrencyVertex,
                         to: Currency,
                         visited: [CurrencyVertex] = [],
                         path: [RateEdge] = []) {
        if current.currency == to {
            self.pathCurrency = path
            return
        }
        if current.edges.count == 0 || visited.filter({ return $0 == current }).count > 0 {
            return
        }
        var visitedVertex = visited
        visitedVertex.append(current)
        for edge in current.edges {
            var currentPath = path
            currentPath.append(edge)
            getPath(current: edge.to, to: to, visited: visitedVertex, path: currentPath)
        }
    }
    
    func findPath(from: Currency, to: Currency) -> [RateEdge]? {
        let currencyFrom = self.vertex.filter({ $0.currency == from }).first!
        self.pathCurrency = nil
        getPath(current: currencyFrom, to: to)
        return self.pathCurrency
    }
}
