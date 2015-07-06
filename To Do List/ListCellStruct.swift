//
//  ListCellStruct.swift
//  To Do List
//
//  Created by Zainuddin Qazi on 5/10/15.
//  Copyright (c) 2015 Zainuddin Qazi. All rights reserved.
//

import Foundation

struct ListCellStruct{
    
    var content : String
    var containsSubList : Bool
    var subList: Array<ListCellStruct>
    
    init() {
        containsSubList = false
        content = ""
        subList = []
    }
}