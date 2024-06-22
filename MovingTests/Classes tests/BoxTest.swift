//
//  boxTest.swift
//  MovingTests
//
//  Created by Michelle Thorn on 6/22/24.
//

import XCTest
@testable import Moving

class BoxTest: XCTestCase {
    
    var firstBox: Box!
    
    // setup and teardown create a box that can be used in all tests
    override func setUp(){
        super.setUp()
        firstBox = Box(name: "first", code: 1, desc: "first box for testing")
    }
    
    override func tearDown() {
        firstBox = nil
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

