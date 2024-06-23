//
//  MovingApp.swift
//  Moving
//
//  Created by Michelle Thorn on 6/6/24.
//

import SwiftUI
import SwiftData

@main
struct MovingApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
     
        
    }
}
