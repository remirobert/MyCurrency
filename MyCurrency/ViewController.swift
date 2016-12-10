//
//  ViewController.swift
//  MyCurrency
//
//  Created by Remi Robert on 07/12/2016.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let network = Network()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.network.perform(ressource: Ressource.all()) { models in
            print("models fetched : \(models)")
        }
    }
}

