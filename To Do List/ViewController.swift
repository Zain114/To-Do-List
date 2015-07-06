//
//  ViewController.swift
//  To Do List
//
//  Created by Zainuddin Qazi on 5/9/15.
//  Copyright (c) 2015 Zainuddin Qazi. All rights reserved.

//if tableview is touched
//if no cell exists, popup to create cell
//if cell exists, if keyboard isnt up, expand list
//if keyboard active resign keyboard
//if double tap, edit content

//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UIGestureRecognizerDelegate {

    var lists : [[ListCellStruct]] = [[]]
    var currentList : [ListCellStruct] = []
    var allowEditing : Bool = false
    var cellPanDistance : CGFloat = 0.0
    var lastWasPan = false
    
    @IBOutlet weak var tableView: UITableView!

    
    func createSublist() {
        
        println("Function: createSublist")
        lists.append(currentList)
        currentList = []
        tableView.reloadData()
        
    }
    
    
    func cellExists(location: CGPoint) -> Bool {
        
        var exists = false
        
        var numCells = currentList.count
        if Int(location.y) < 44*numCells {
            exists = true
        }
        
        return exists
        
    }
    
    
    func tableTappedGesture(recognizer: UITapGestureRecognizer) {
        
        println("Function: tableTappedGesture")
        
        var tapLocation = recognizer.locationInView(tableView)
        if cellExists(tapLocation) == false {
        
            var newListCellStruct = ListCellStruct()
            currentList.append(newListCellStruct)
            tableView.reloadData()
            
        }
        
        lastWasPan = false
            
    }
    
    
    func textfieldTapped(recognizer: UITapGestureRecognizer) {
        
        println("Function: textboxTapped")
        
        var row = recognizer.view!.tag
        
        var cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0)) as! ListCell
        
        var textfield = cell.cellTextBox
        
        textfield.allowEditing = true
        
        textfield.becomeFirstResponder()
        
        lastWasPan = false
        
    }
    
    
    func cellTapped(recognizer: UITapGestureRecognizer) {
        
        println("Function: cellTapped")
        
        var numTouches = recognizer.numberOfTouches()
        
        if numTouches > 1 {
            
            
            
        } else {
            
            //cellTextBox = true
            //cellTextView.becomeFirstResponder()
            
        }
        
        lastWasPan = false
        
    }
    
    func cellPanGesture(recognizer: UIPanGestureRecognizer) {
        
        println("Function: cellPanGesture")
        
        if !lastWasPan {
            
            cellPanDistance = 0
            
        }
        
        cellPanDistance = cellPanDistance + recognizer.translationInView(view).x
        
        println(cellPanDistance)
        
        lastWasPan = true
        
        if cellPanDistance > 50 {
            
            cellPanDistance = 0
            lastWasPan = false
            
        }
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currentList.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("listcell") as! ListCell
        cell.tag = indexPath.row
        cell.row = indexPath.row
        cell.cellTextBox.tag = indexPath.row
        cell.cellTextBox.row = indexPath.row
        cell.cellTextBox.delegate = self
        cell.cellTextBox.borderStyle = UITextBorderStyle.None
        
        var tappedGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("cellTapped:"))
        tappedGestureRecognizer.numberOfTapsRequired = 1
        tappedGestureRecognizer.delegate = self
        cell.addGestureRecognizer(tappedGestureRecognizer)
        
        var pannedGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("cellPanGesture:"))
        pannedGestureRecognizer.delegate = self
        cell.addGestureRecognizer(pannedGestureRecognizer)
        
        var textFieldGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("textfieldTapped:"))
        textFieldGestureRecognizer.numberOfTapsRequired = 2
        textFieldGestureRecognizer.delegate = self
        cell.cellTextBox.addGestureRecognizer(textFieldGestureRecognizer)
        
        return cell
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        println("Function: textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        println("Function: textFieldShouldEndEditing")
        
        var textfield = textField as! TextField
        var row = textfield.row
        currentList[row].content = textfield.text
        
        return true
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        println("Function: textFieldShouldBeginEditing")
        
        return false
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        
        var tapResponder = UITapGestureRecognizer(target: self, action: Selector("tableTappedGesture:"))
        tapResponder.delegate = self
        self.tableView.addGestureRecognizer(tapResponder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "createSublist", name: "createSublistNotification", object: nil)
        
        //var addCell = ListCellStruct()
        //addCell.content = "+"
        //currentList.append(addCell)
    }
    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

