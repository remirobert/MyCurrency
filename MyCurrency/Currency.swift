//
//  Currency.swift
//  MyCurrency
//
//  Created by Remi Robert on 07/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

enum Currency: String {
    case EUR = "EUR"
    case USD = "USD"
    case JPY = "JPY"
    case GBP = "GBP"
    case CHF = "CHF"
    case CAD = "CAD"
    case AUD = "AUD"
    
    static func all() -> [Currency] {
        return [.EUR, .USD, .JPY, .GBP, .CHF, .CAD, .AUD]
    }
}
