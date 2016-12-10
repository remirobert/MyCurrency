//
//  Ressource.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

struct Ressource {

    var url: URL
    let parse: (Data?) -> [CurrencyModel]?
    
    init(url: URL, parse: @escaping ((Data?) -> [CurrencyModel]?)) {
        self.url = url
        self.parse = parse
    }
}

extension Ressource {
    
    static func all() -> Ressource {
        let url = "https://raw.githubusercontent.com/mydrive/code-tests/master/iOS-currency-exchange-rates/rates.json"
        return Ressource(url: URL(string: url)!) { data -> [CurrencyModel]? in
            guard let data = data else { return nil }
            do {
                let jsonRoot = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonRoot as? NSDictionary else { return nil }
                guard let currencies = json["conversions"] as? [[String:AnyObject]] else { return nil }
                return currencies.flatMap({ currencyJson -> CurrencyModel? in
                    return CurrencyModel(json: currencyJson)
                })
            }
            catch {}
            return nil
        }
    }
}
