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
        setupSnapshot(app)
        app.launch()
    }
    
    func testSnapshots() {
        let app = XCUIApplication()
        
        // Take a snapshot of the launch screen.
        snapshot("0Launch")
        
        // Take a snapshot of the setup screen.
        app.buttons.elementBoundByIndex(0).tap()
        app.pickerWheels.elementBoundByIndex(0).adjustToPickerWheelValue("1984")
        snapshot("1Setup")
        
        // Take a snapshot of the home screen.
        app.buttons.elementBoundByIndex(1).tap()
        snapshot("2Home")
        
        // Take a snapshot of the settings screen.
        app.buttons.elementBoundByIndex(0).tap()
        app.pickerWheels.elementBoundByIndex(0).adjustToPickerWheelValue("1988")
        snapshot("3Settings")
    }
}
