//
//  RateEdge.swift
//  MyCurrency
//
//  Created by Remi Robert on 07/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct RateEdge {
    
    let from: CurrencyVertex
    let to: CurrencyVertex
    let rate: Double
    
    init(from: CurrencyVertex, to: CurrencyVertex, for rate: Double) {
        self.rate = rate
        self.from = from
        self.to = to
    }
}
