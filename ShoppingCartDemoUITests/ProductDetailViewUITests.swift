//
//  ShoppingCartDemoUITests.swift
//  ShoppingCartDemoUITests
//
//  Created by Maheep on 18/05/24.
//
import XCTest
import SwiftUI

class ProductDetailViewUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testTabBarComponents() {
        let tabBar = app.tabBars["Tab Bar"]
        XCTAssert(tabBar.buttons["Products"].exists)
        XCTAssert(tabBar.buttons["Cart"].exists)
    }
    
    func testProductDetailViewUI() {
        app.collectionViews["Sidebar"].buttons["Microwave Oven, $299.00"].tap()

        let navBar = app.navigationBars["Microwave Oven"]
        XCTAssertTrue(navBar.exists)
        
        let addToCart = app.buttons["Add to Cart"]
        XCTAssert(addToCart.exists)
    }
    
    func testProductDetailSwitchingBetweenProductsShowsRightProduct() {
        app.collectionViews["Sidebar"].buttons["Microwave Oven, $299.00"].tap()

        let navBar = app.navigationBars["Microwave Oven"]
        XCTAssertTrue(navBar.exists)
        
        navBar.buttons["Products"].tap()
        
        app.collectionViews["Sidebar"].buttons["Television, $799.00"].tap()
        
        let newNavBar = app.navigationBars["Television"]
        XCTAssertTrue(newNavBar.exists)
    }
}
