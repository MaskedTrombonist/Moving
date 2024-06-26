//
//  boxTest.swift
//  MovingTests
//
//  Created by Michelle Thorn on 6/22/24.
//

import XCTest
@testable import Moving

class BoxTest: XCTestCase {
    
    var managedObjectContext: NSManagedObjectContext!
    var boxManager: BoxManager!
    var firstBox: Box!
    
    // setup and teardown create an Box that can be used in all tests
    override func setUp(){
        super.setUp()
        let persistentContainer = NSPersistentContainer(name: "Model")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        
        persistentContainer.loadPersistentStores { (description, error) in XCTAssertNil(error)}
        
        managedObjectContext = persistentContainer.viewContext
        boxManager = BoxManager(context: managedObjectContext)
        
        firstBox = boxManager.createBox(name: "first", code: 1, desc: "first box for testing")
    }
    
    override func tearDown() {
        firstBox = nil
        boxManager = nil
        managedObjectContext = nil
        super.tearDown()
    }
    func testBoxNameShouldBeFirst() {
        let result = firstBox.name
        XCTAssertEqual(result, "first")
    }
    func testBoxCodeShouldBe1() {
        let result = firstBox.code
        XCTAssertEqual(result, 1)
    }
    func testBoxCodeShouldBeCreated() {
        let result = firstBox.desc
        XCTAssertEqual(result, "first box for testing")
    }
    

}

