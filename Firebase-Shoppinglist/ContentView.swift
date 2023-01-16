//
//  ContentView.swift
//  Firebase-Shoppinglist
//
//  Created by Admin on 2023-01-13.
//

import SwiftUI
import Firebase


struct ContentView: View {
    let db = Firestore.firestore()
    @State var items = [Item]()
    
    
    var body: some View {
        VStack{
            List {
                ForEach(items){ item in
                    Text(item.name)
                }
            }
            
        }.onAppear() {
            
         listenToFirestore()

        }

        
        .padding()
    }
    
    func saveToFirestore(itemName: String) {
      //  let item = Item(name: itemName)
        
        //db.collection("items").addDocument(from: Item)
        db.collection("items").addDocument(data: ["name" : itemName,
                                                  "category" : "",
                                                  "done" : false])
    }
    
    
     func listenToFirestore() {
        db.collection("items").addSnapshotListener { snapshot, err in
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("Error getting document \(err)")
            } else {
                
                for document in snapshot.documents {
                    let item = Item(id: document.documentID,
                                    name: document["name"] as! String,
                                    category: document["category"] as! String,
                                    done: document["done"] as! Bool)
                    items.append(item)
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
