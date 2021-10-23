//
//  ProductManager.swift
//  Cashier
//
//  Created by Михаил Пак on 18.10.2021.
//

import Foundation

class ProductManager {
    var products = [Product]()
    var quantity = 0
    var total = 0
    
    var selectedProduct: Product? = nil
    
    func fillProducts()
    {
        products.append(Product(n: "Pants", q: 20, p: 15))
        products.append(Product(n: "Shoes", q: 50, p: 20))
        products.append(Product(n: "Hats", q: 10, p: 10))
        products.append(Product(n: "T-Shirts", q: 10, p: 5))
        products.append(Product(n: "Dresses", q: 24, p: 25))
    }
    
    func getAllProducts() -> [Product] {
        return products
    }
    
    func setSelectedProduct(p: Product) {
        selectedProduct = p
    }
    func getSelectedProduct() -> Product {
        return selectedProduct!
    }
    
    func removeSelectedProduct() {
        selectedProduct = nil
    }
    
    func setQuantity(q: Int) {
        if quantity * 10 + q <= selectedProduct!.quantity {
            quantity = quantity * 10 + q
        } else {
            quantity = 0
        }
    }
    
    func resetQuantity() {
        quantity = 0
    }
    
    func getTotal() -> Int {
        return selectedProduct!.price * quantity
    }
    
    func buyProduct() {
        selectedProduct!.quantity = selectedProduct!.quantity - quantity
        quantity = 0
    }
    
    func restockQuantity(i: Int){
        selectedProduct?.quantity += i
    }
    
}
