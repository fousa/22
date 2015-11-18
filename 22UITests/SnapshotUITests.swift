//
//  _2UITests.swift
//  22UITests
//
//  Created by Jelle Vandebeeck on 18/11/15.
//  Copyright © 2015 Fousa. All rights reserved.
//

import XCTest

class SnapshotUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        let app = XCUIApplication()
        app.launchArguments = ["uiTesting"]
        setLanguage(app)
        app.launch()
    }
    
    func testExample() {
        
        snapshot("0Launch")
        
        XCUIApplication().buttons.elementBoundByIndex(0).tap()
        snapshot("1Setup")
        
        XCUIApplication().buttons.elementBoundByIndex(1).tap()
        snapshot("2Home")
        
        XCUIApplication().buttons.elementBoundByIndex(0).tap()
        snapshot("3Settings")
    }
}
