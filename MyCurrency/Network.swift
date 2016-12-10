//
//  Network.swift
//  MyCurrency
//
//  Created by Remi Robert on 09/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class Network {

    func perform(ressource: Ressource, completion: @escaping ([CurrencyModel]?) -> Void) {
        URLSession.shared.dataTask(with: ressource.url) { (data, _, _) in
            completion(ressource.parse(data))
        }.resume()
    }
}
