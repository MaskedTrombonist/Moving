//
//  ContentView.swift
//  Moving
//
//  Created by Michelle Thorn on 6/6/24.
//

import SwiftUI
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
    @State private var selectedBox: Box?
    
    var body: some View {
        NavigationSplitView{
            List(selection: $selectedBox){
                ForEach(boxes) {box in
                    Text("\(box.code) - \(box.name ?? "No name")")
                        .tag(box)
                    }
                
            }
            .navigationTitle("Boxes")
            VStack{
                Spacer()
                HStack{
                    Button(action: addBox){
                        Label("Add Box", systemImage: "plus")
                    }
                    .padding()
                    Spacer()
                }
            }
        } detail: {
                if let selBox = selectedBox {
                VStack{ //whole deteail section
                    HStack{ //upper portion
                        VStack{ //just the text in the upper portion
                            Text("\(selBox.code) - \(selBox.name ?? "No name")")
                            if let description = selBox.desc {
                                Text(description)
                            }
                        }
                        .padding()
                        Spacer()
                        //add an image here later
                    }
                    Divider()
                    Spacer()
                }
            } else {
                Text("Select a Box")
            }
            
        }
        }
    private func addBox() {
        
        withAnimation {
            
            let newBox = Box(context: viewContext)
            newBox.code = 1
            newBox.name = "boxy box"
            newBox.desc = "This is a box"
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    }
//    func buttonClicked(){
//        var boxManager =  BoxManager(context: context )
//        let newBox = boxManager.createBox(name: "Boxy McBoxerton", code: 2, desc: "This is a box")
//    }
 
#Preview {
    ContentView().environment(\.managedObjectContext,
    PersistenceController.preview.container.viewContext)
}
