//
//  CartViewUITests.swift
//  ShoppingCartDemoUITests
//
//  Created by Maheep on 19/05/24.
//

import XCTest
import SwiftUI
import ShoppingCartDemo

class CartViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testCarNavPage() {
        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Cart"].tap()
        XCTAssertTrue(app.navigationBars["Cart"].exists)
    }
    
    func testCartWithAddingSomeProducts() {
        app.collectionViews["Sidebar"].buttons["Microwave Oven, $299.00"].tap()
        app.buttons["Add to Cart"].tap()

        let tabBar = app.tabBars["Tab Bar"]
        tabBar.buttons["Cart"].tap()
        let collectionView = app.collectionViews.firstMatch

        XCTAssertTrue(collectionView.buttons.count >= 1)
    }
}
