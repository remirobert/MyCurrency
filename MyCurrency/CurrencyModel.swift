//
//  CurrencyModel.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct CurrencyModel {
    
    var to: Currency
    var from: Currency
    var rate: Double
    
    init?(json: [String:AnyObject]) {
        guard let to = Currency(rawValue: (json["to"] as? String) ?? ""),
            let from = Currency(rawValue: (json["from"] as? String) ?? ""),
            let rate = json["rate"] as? Double else {
                return nil
        }
        self.to = to
        self.from = from
        self.rate = rate
    }
}
