//
//  CurrencyVertex.swift
//  MyCurrency
//
//  Created by Remi Robert on 07/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class CurrencyVertex: Equatable {
    
    let currency: Currency
    var edges = [RateEdge]()
    
    init(currency: Currency) {
        self.currency = currency
    }
}

func ==(vertex1: CurrencyVertex, vertex2: CurrencyVertex) -> Bool {
    return vertex1.currency == vertex2.currency
}
