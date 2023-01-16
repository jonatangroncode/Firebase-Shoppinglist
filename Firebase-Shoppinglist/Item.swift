//
//  Item.swift
//  Firebase-Shoppinglist
//
//  Created by Admin on 2023-01-15.
//

import Foundation


struct Item : Codable, Identifiable {
    var id : String
    
    var name : String 
    var category : String = ""
    var done : Bool = false
    
}
