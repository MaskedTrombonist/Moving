//
//  itemTest.swift
//  MovingTests
//
//  Created by Michelle Thorn on 6/22/24.
//

import XCTest
@testable import Moving

class itemTest: XCTestCase {

    var managedObjectContext: NSManagedObjectContext!
    var itemManager: ItemManager!
    var firstItem: Item!
    
    // setup and teardown create an item that can be used in all tests
    override func setUp(){
        super.setUp()
        let persistentContainer = NSPersistentContainer(name: "Model")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        
        persistentContainer.loadPersistentStores { (description, error) in XCTAssertNil(error)}
        
        managedObjectContext = persistentContainer.viewContext
        itemManager = ItemManager(context: managedObjectContext)
        
        firstItem = itemManager.createItem(name: "first", code: 1, desc: "first Item for testing")
    }
    
    override func tearDown() {
        firstItem = nil
        itemManager = nil
        managedObjectContext = nil
        super.tearDown()
    }
    
    func testItemNameShouldBeFirst() {
        let result = firstItem.name
        XCTAssertEqual(result, "first")
    }
    func testItemCodeShouldBe1() {
        let result = firstItem.code
        XCTAssertEqual(result, 1)
    }
    func testItemCodeShouldBeCreated() {
        let result = firstItem.desc
        XCTAssertEqual(result, "first Item for testing")
    }

}
