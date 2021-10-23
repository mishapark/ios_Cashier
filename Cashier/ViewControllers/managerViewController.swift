//
//  managerViewController.swift
//  Cashier
//
//  Created by Михаил Пак on 19.10.2021.
//

import UIKit

class managerViewController: UIViewController {

    var productManager: ProductManager?
    var historyManager: HistoryManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "history" {
            let htvc = segue.destination as? historyTableViewController
            htvc!.historyManager = historyManager
        } else {
            let rvc = segue.destination as? restockViewController
            rvc!.productManager = productManager
        }
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
