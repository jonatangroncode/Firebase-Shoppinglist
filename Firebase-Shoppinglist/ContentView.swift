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
                    HStack{
                    Text(item.name)
                        Spacer()
                        Button(action: {
                            if let id = item.id {
                            db.collection("items").document(id).updateData(["done" : !item.done])
                            }
                        }) {
                        Image(systemName: item.done ? "checkmark.square" : "square")
                        }
                    }
                }.onDelete() {indexSet in
                    for index in indexSet {
                        let item = items[index]
                        if let id = item.id {
                        db.collection("items").document(id).delete()
                        }
                    }
                    
                }
            }
            
        }.onAppear() {
         saveToFirestore(itemName: "gurka")
         listenToFirestore()

        }

        
        .padding()
    }
    
    func saveToFirestore(itemName: String) {
        let item = Item(name: itemName)
        
        do {
       _ = try db.collection("items").addDocument(from: item)
            
        } catch {
            print("error saving to DB")
        }
//        db.collection("items").addDocument(data: ["name" : itemName,
//                                                  "category" : "",
//                                                  "done" : false])
    }
    
    
     func listenToFirestore() {
        db.collection("items").addSnapshotListener { snapshot, err in
            guard let snapshot = snapshot else {return}
            
            if let err = err {
                print("Error getting document \(err)")
            } else {
                items.removeAll()
                for document in snapshot.documents {
//                    let item = Item(id: document.documentID,
//                                    name: document["name"] as! String,
//                                    category: document["category"] as! String,
//                                    done: document["done"] as! Bool)
                    
                    
                    let result = Result{
                        try document.data(as: Item.self)
                    }
                    switch result {
                    case .success(let item) :
                        items.append(item)
                    case .failure(let error) :
                        print("Error decoding item: \(error)")
                    
                    }
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
 
