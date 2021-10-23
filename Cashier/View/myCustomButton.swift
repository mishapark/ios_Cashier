//
//  myCustomButton.swift
//  Cashier
//
//  Created by Михаил Пак on 17.10.2021.
//

import UIKit

class myCustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = layer.frame.height / 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    
    }
    
    
}
