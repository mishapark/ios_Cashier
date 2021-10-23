//
//  alertService.swift
//  Cashier
//
//  Created by Михаил Пак on 18.10.2021.
//

import UIKit

class AlertService {
    func alert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
