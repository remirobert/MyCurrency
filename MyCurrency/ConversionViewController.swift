//
//  ConversionViewController.swift
//  MyCurrency
//
//  Created by Remi Robert on 10/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    fileprivate let viewmodel = ConversionViewModel()
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewmodel.delegate = self
        
        self.tableview.tableFooterView = UIView()
        self.tableview.delegate = self
        self.tableview.dataSource = self.viewmodel
    }
}

extension ConversionViewController: ConversionViewModelDelegate {

    func didUpdateConversions() {
        self.tableview.reloadData()
    }
    
    func didGetError(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ConversionViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Choose a value to convert :", message: nil, preferredStyle: .alert)
        let valueAction = UIAlertAction(title: "Convert", style: .default) { (_) in
            guard let textfield = alert.textFields?[0] else { return }
            let value = Double(textfield.text ?? "") ?? 0
            self.viewmodel.convert(from: Currency.all()[indexPath.row], value: value)
        }
        alert.addAction(valueAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { textfield in
            textfield.placeholder = "value"
            textfield.keyboardType = .numberPad
        }
        self.present(alert, animated: true, completion: nil)
    }
}
