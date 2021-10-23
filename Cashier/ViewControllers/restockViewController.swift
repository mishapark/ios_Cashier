//
//  restockViewController.swift
//  Cashier
//
//  Created by Михаил Пак on 19.10.2021.
//

import UIKit

class restockViewController: UIViewController, UITextFieldDelegate {

    var productManager: ProductManager?
    var alert = AlertService()
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    func isProductSelected() -> Bool {
        if productManager!.selectedProduct == nil {
            let alert = alert.alert(message: "Select the product first")
            present(alert, animated: true)
            return false
        }
        return true
    }
    func isQuantitySet() -> Bool {
        if textField.text == "" {
            let alert = alert.alert(message: "Enter quantity")
            present(alert, animated: true)
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTable.delegate = self
        productTable.dataSource = self
        textField.delegate = self
        productManager!.removeSelectedProduct()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    @IBAction func restockBtn(_ sender: Any) {
        if isProductSelected() {
            if isQuantitySet() {
                productManager?.restockQuantity(i: Int(textField.text!) ?? 0)
                productTable.reloadData()
                productManager?.removeSelectedProduct()
                textField.endEditing(true)
                textField.text = ""
            }
        }
    }
    @IBAction func cancelBtn(_ sender: Any) {
        productManager?.removeSelectedProduct()
        _ = navigationController?.popViewController(animated: true)
    }
}

extension restockViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = productManager!.getAllProducts()[indexPath.row]
        productManager!.setSelectedProduct(p: selectedProduct)
    }
}

extension restockViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager!.getAllProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = productManager!.getAllProducts()[indexPath.row].name
        cell.detailTextLabel?.text = "\(productManager!.getAllProducts()[indexPath.row].quantity)"
        
        return cell
    }
}
