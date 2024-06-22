//
//  BoxManager.swift
//  Moving
//
//  Created by Michelle Thorn on 6/22/24.
//

import Foundation
import CoreData

public class BoxManager {
    private let context: NSManagedObjectContext
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    func createBox (name: String, code: Int32, desc: String) -> Box {
        let box = Box(context: context)
        box.name = name
        box.code = code
        box.desc = desc
        return box
    }
    
    func fetchAllBoxes() -> [Box] {
        let fetchRequest: NSFetchRequest<Box> = Box.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch items: \(error)")
            return[]
        }
    }
    
    func deleteBox(box: Box){
        context.delete(box)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
