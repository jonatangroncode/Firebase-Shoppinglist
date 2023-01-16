//
//  Firebase_ShoppinglistApp.swift
//  Firebase-Shoppinglist
//
//  Created by Admin on 2023-01-13.
//

import SwiftUI
import Firebase

@main
struct Firebase_ShoppinglistApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
