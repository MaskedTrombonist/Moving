//
//  ContentView.swift
//  Moving
//
//  Created by Michelle Thorn on 6/6/24.
//

import SwiftUI
import SwiftData
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
//    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)],
//        animation: .default)
//    
//    private var items: FetchedResults<Item>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Box.name, ascending: true)],
        animation: .default)
    
    private var boxes: FetchedResults<Box>
    
    
    var body: some View {
        NavigationView{
            List {
                ForEach(boxes) {box in
                    NavigationLink {
                        Text("\(box.code) - \(box.name ?? "No name")")
                    } label: {
                        Text(box.name ?? "No name")
                    }
                }
//                .onDelete(Perform: deleteBoxes)
            }
        }
        VStack {
            Text("Welcome to the moving app select a box on the left to view what's in it")
        }
        .padding()

        
        
        
    }
//    func buttonClicked(){
//        var boxManager =  BoxManager(context: context )
//        let newBox = boxManager.createBox(name: "Boxy McBoxerton", code: 2, desc: "This is a box")
//    }
}

#Preview {
    ContentView()
}
