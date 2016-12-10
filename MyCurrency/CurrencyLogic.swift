//
//  CurrencyLogic.swift
//  MyCurrency
//
//  Created by Remi Robert on 09/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

extension Currency {
    
    func convert(to: Currency, value: Double, graph: CurrencyGraph = CurrencyGraph.sharedGraph) -> ResultConversion {
        guard let path = graph.findPath(from: self, to: to) else {
            return .notFound
        }
        return .value(path.reduce(value, { (currentValue, rate) -> Double in
            return currentValue * Double(rate.rate)
        }))
    }
}
