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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Box.self)
        }
    }
}
