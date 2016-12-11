//
//  Conversion.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct Conversion {
    
    let currency: Currency
    let result: ResultConversion
    
    init(currency: Currency, result: ResultConversion) {
        self.currency = currency
        self.result = result
    }
}
