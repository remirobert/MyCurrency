//
//  ConversionViewModel.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol ConversionViewModelDelegate: class {
    
    func didUpdateConversions()
    func didGetError(message: String)
}

class ConversionViewModel: NSObject {
    
    static let cellIdentifier = "cell"
 
    weak var delegate: ConversionViewModelDelegate?
    private let network = Network()
    
    fileprivate var conversions = [Conversion]() {
        didSet {
            self.delegate?.didUpdateConversions()
        }
    }
    
    func convert(from: Currency, value: Double) {
        self.conversions = Currency.all().map { currency -> Conversion in
            let result = from.convert(to: currency, value: value)
            return Conversion(currency: currency, result: result)
        }
        self.delegate?.didUpdateConversions()
    }
    
    private func fetchConversions() {
        self.network.perform(ressource: Ressource.all()) { models in
            guard let models = models else {
                self.delegate?.didGetError(message: "Impossible to get the conversions.")
                return
            }
            
            for model in models {
                CurrencyGraph.sharedGraph.addRate(from: model.from, to: model.to, for: model.rate)
            }
            DispatchQueue.main.async {
                self.convert(from: Currency.EUR, value: 1)
            }
        }
    }
    
    override init() {
        super.init()
        self.fetchConversions()
    }
}

extension ConversionViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.conversions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConversionViewModel.cellIdentifier)!
        
        let currentConversion = self.conversions[indexPath.row]
        (cell as? ConversionViewProtocol)?.configure(model: currentConversion)
        return cell
    }
}
