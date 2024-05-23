//
//  ProductViewUITests.swift
//  ShoppingCartDemoUITests
//
//  Created by Maheep on 18/05/24.
//

import XCTest
import SwiftUI
import ShoppingCartDemo

class ProductListViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testProductListNavPage() {
        XCTAssertTrue(app.navigationBars["Products"].exists)
    }
    
    func testPickerElementExitsAndCount() {
        XCTAssertTrue(app!.segmentedControls["PickerCategory"].exists)
        XCTAssertTrue(app!.segmentedControls["PickerCategory"].buttons.count == 3)
    }
    
    func testCollectionViewItemsByChangingPickerValues() {
        let picker = app!.segmentedControls["PickerCategory"]
        picker.buttons["All"].tap()
        XCTAssertTrue(app!.collectionViews["Sidebar"].buttons.count == 6)
        
        picker.buttons["Electronic"].tap()
        XCTAssertTrue(app!.collectionViews["Sidebar"].buttons.count == 3)
        
        picker.buttons["Furniture"].tap()
        XCTAssertTrue(app!.collectionViews["Sidebar"].buttons.count == 3)
    }
}
