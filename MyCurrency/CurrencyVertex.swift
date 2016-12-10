//
//  CurrencyVertex.swift
//  MyCurrency
//
//  Created by Remi Robert on 07/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class CurrencyVertex {
    
    let currency: Currency
    var edges = [RateEdge]()
    
    init(currency: Currency) {
        self.currency = currency
    }
}
