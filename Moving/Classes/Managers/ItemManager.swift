//
//  ItemManager.swift
//  Moving
//
//  Created by Michelle Thorn on 6/22/24.
//

import Foundation
import CoreData

public class ItemManager {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func createItem(name: String, code: Int32, desc: String) -> Item {
        let item = Item(context: context)
        item.name = name
        item.code = code
        item.desc = desc
        saveContext()
        return item
    }

    func fetchAllItems() -> [Item] {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch items: \(error)")
            return []
        }
    }

    func deleteItem(item: Item) {
        context.delete(item)
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

