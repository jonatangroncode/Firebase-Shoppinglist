//
//  ContentView.swift
//  Firebase-Shoppinglist
//
//  Created by Admin on 2023-01-13.
//

import SwiftUI



struct ContentView: View {
    @State var items = [Item]()
    
    init() {
        items.append(Item(name: "morot"))
        items.append(Item(name: "mjölk"))
        items.append(Item(name: "sirap"))
        
    }
    
    var body: some View {
        VStack{
            List {
                ForEach(items){ item in
                    Text(item.name)
                }
            }
            
        }

        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
