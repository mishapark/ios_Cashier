//
//  historyItemViewController.swift
//  Cashier
//
//  Created by Михаил Пак on 19.10.2021.
//

import UIKit

class historyItemViewController: UIViewController {

    var historyManager: HistoryManager?
    var dateFormatter = DateFormatter()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var total: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let selected = historyManager!.selectedHistoryObject
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy, HH:mm"

        name.text = selected!.name
        quantity.text = "Quantity: \(selected!.quantity)"
        date.text = "\(dateFormatter.string(from: selected!.date))"
        total.text = "Total amount: \(selected!.totalPrice)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
