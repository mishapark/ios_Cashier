//
//  ViewController.swift
//  Cashier
//
//  Created by Михаил Пак on 17.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var productManager = ProductManager()
    var historyManager = HistoryManager()
    var alert = AlertService()
    
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var typeLable: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    
    func isProductSelected() -> Bool {
        if productManager.selectedProduct == nil {
            let alert = alert.alert(message: "Select the product first")
            present(alert, animated: true)
            return false
        }
        return true
    }
    
    func isCorrectQuantity() -> Bool {
        if productManager.quantity == 0 {
            let alert = alert.alert(message: "Wrong quantity")
            present(alert, animated: true)
            qtyLabel?.text = "Quantity"
            totalLabel.text = "Total"
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cashier App"
        productManager.fillProducts()
        productTable.dataSource = self
        productTable.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        productTable.reloadData()
    }
    
    @IBAction func btnOne(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 1)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnTwo(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 2)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnThree(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 3)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnFour(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 4)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnFive(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 5)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnSix(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 6)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnSeven(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 7)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnEight(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 8)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnNine(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 9)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    @IBAction func btnZero(_ sender: Any) {
        if isProductSelected() {
            productManager.setQuantity(q: 0)
            if isCorrectQuantity() {
                qtyLabel?.text = "\(productManager.quantity)"
                totalLabel.text = "\(productManager.getTotal())"
            }
        }
    }
    
    
    @IBAction func buyBtn(_ sender: Any) {
        if isProductSelected() {
            if isCorrectQuantity() {
                let selectedProduct = productManager.getSelectedProduct()
                let name = selectedProduct.name
                let quantity = productManager.quantity
                let price = selectedProduct.price
                let total = quantity * price
                
                productManager.buyProduct()
                historyManager.addProductToHistory(n: name, q: quantity, tp: total, d: Date())
                productTable.reloadData()
                productManager.removeSelectedProduct()
                
                typeLable?.text = "Type"
                qtyLabel?.text = "Quantity"
                totalLabel.text = "Total"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mvc = segue.destination as? managerViewController
        mvc!.productManager = productManager
        mvc?.historyManager = historyManager
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = productManager.getAllProducts()[indexPath.row]
        
        productManager.resetQuantity()
        productManager.setSelectedProduct(p: selectedProduct)
        typeLable?.text = selectedProduct.name
        qtyLabel?.text = "Quantity"
        totalLabel.text = "Total"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.getAllProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! myTableViewCell
        
        cell.productTitle.text = productManager.getAllProducts()[indexPath.row].name
        cell.productQuantity?.text = " \(productManager.getAllProducts()[indexPath.row].quantity) left"
        cell.productPrice.text = "$\(productManager.getAllProducts()[indexPath.row].price)"
        
        return cell
    }
}
