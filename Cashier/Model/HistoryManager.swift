//
//  History.swift
//  Cashier
//
//  Created by Михаил Пак on 19.10.2021.
//

import Foundation

class HistoryManager {
    var products = [HistoryObject]()
    var selectedHistoryObject: HistoryObject? = nil

    func addProductToHistory(n: String, q: Int, tp: Int, d: Date) {
        products.append(HistoryObject(n: n, q: q, tp: tp, d: d))
    }
    
    func getProducts() -> [HistoryObject] {
        return products
    }
    
    func setSelected(ho: HistoryObject) {
        selectedHistoryObject = ho
    }
}
