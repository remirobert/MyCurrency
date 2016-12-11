
//
//  ConversionTableViewCell.swift
//  MyCurrency
//
//  Created by Remi Robert on 11/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ConversionTableViewCell: UITableViewCell, ConversionViewProtocol {

    @IBOutlet weak var labelCurrency: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: Conversion) {
        self.labelCurrency.text = model.currency.rawValue
        switch model.result {
        case .value(let v):
            self.labelValue.text = "\(v)"
        case .notFound:
            self.labelValue.text = "Not found."
        }
    }
}
