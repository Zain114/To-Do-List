//
//  ListCell.swift
//  To Do List
//
//  This represents a cell that can hold a sub list. If sublist exists, tapping the cell twice results in 
//  editing the cell's content, and tapping once results in a segue to the sublist
//
//  Created by Zainuddin Qazi on 5/10/15.
//  Copyright (c) 2015 Zainuddin Qazi. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell, UITextFieldDelegate {

    var data : ListCellStruct = ListCellStruct()
    var row : Int = 0
    
    @IBOutlet weak var cellTextBox: TextField!
   
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    /*
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
    
        println("Function: touchesBegan")
        var numTouches = touches.count
        var touches : UITouch = touches.first as! UITouch
        println("Num Touches = \(numTouches)")
        if numTouches > 1 {
            //make text view editable
            cellTextView.editable = true
            //edit text view
            cellTextView.becomeFirstResponder()

        } else if data.containsSubList == true {
            //notify view controller that we are creating sublist
            NSNotificationCenter.defaultCenter().postNotificationName("createSublistNotification", object: nil)
        }
        
    }
    */
    
    override func prepareForReuse() {
        
        var color: CGFloat = CGFloat(row)/10.0
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: color, alpha: 1.0)
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
