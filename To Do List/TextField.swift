//
//  TextField.swift
//  To Do List
//
//  Created by Zainuddin Qazi on 5/15/15.
//  Copyright (c) 2015 Zainuddin Qazi. All rights reserved.
//

import UIKit

class TextField: UITextField {

    var allowEditing : Bool = false
    var row = 0
    
    override func canBecomeFirstResponder() -> Bool {
        
        return allowEditing
        
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
