//
//  Product.swift
//  Cashier
//
//  Created by Михаил Пак on 18.10.2021.
//

import Foundation

class Product {
    var name: String = ""
    var quantity: Int = 0;
    var price: Int = 0
    
    init(n: String, q: Int, p: Int) {
        name = n
        quantity = q
        price = p
    }
}
