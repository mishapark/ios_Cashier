//
//  HistoryObject.swift
//  Cashier
//
//  Created by Михаил Пак on 19.10.2021.
//

import Foundation

class HistoryObject {
    var name = ""
    var quantity = 0
    var totalPrice = 0
    var date = Date()

    init(n: String, q: Int, tp: Int, d: Date) {
        name = n
        quantity = q
        totalPrice = tp
        date = d
    }
}
