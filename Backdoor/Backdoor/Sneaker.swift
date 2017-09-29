//
//  Sneaker.swift
//  Backdoor
//
//  Created by Alexander Lao on 4/27/17.
//  Copyright © 2017 Alexander Lao. All rights reserved.
//

import Foundation
import UIKit

class Sneaker
{
    var brand: String
    var name: String
    var size: String
    var productNumber: String
    var price: String
    var priceBought: Double
    var priceSold: Double
    var dateBought: String
    var dateSold: String
    var currentQuantity: Int
    var boughtQuantity: Int
    var soldQuantity: Int
    var photo: UIImage?
    var type: String
    
    
    init ()
    {
        self.brand = ""
        self.name = ""
        self.size = ""
        self.productNumber = ""
        self.price = ""
        self.priceBought = 0.0
        self.priceSold = 0.0
        self.dateBought = ""
        self.dateSold = ""
        self.currentQuantity = 0
        self.boughtQuantity = 0
        self.soldQuantity = 0
        self.type = ""
    }
}
