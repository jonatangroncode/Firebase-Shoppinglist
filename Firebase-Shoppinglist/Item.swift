//
//  Item.swift
//  Firebase-Shoppinglist
//
//  Created by Admin on 2023-01-15.
//

import Foundation


struct Item : Identifiable {
    var id = UUID()
    
    var name : String 
    var category : String = ""
    var done : Bool = false
    
}
