//
//  MainCoordinatorTests.swift
//  ShoppingCartDemoTests
//
//  Created by Maheep on 18/05/24.
//

import XCTest

class MainCoordinatorTests: XCTestCase {
    
    var coordinator: MainCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = MainCoordinator()
    }

    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }

    func testShowProductDetails() {
        let product = Product(name: "Test Product", category: .electronic, price: 99, imageName: "test_image")
        let productDetailView = coordinator.showProductDetails(product: product)
        
        // Verify that the product detail view is correctly instantiated
        XCTAssertTrue(productDetailView.viewModel.product == product)
        XCTAssertTrue(productDetailView.coordinator === coordinator)
    }
    
    func testShowCart() {
        let cartView = coordinator.showCart()
        
        // Verify that the cart view is correctly instantiated
        XCTAssertTrue(cartView.viewModel === coordinator.cartViewModel)
        XCTAssertTrue(cartView.coordinator === coordinator)
    }
    
    func testBackToProductList() {
        let productListView = coordinator.backToProductList()
        
        // Verify that the product list view is correctly instantiated
        XCTAssertTrue(productListView.viewModel === coordinator.productListViewModel)
        XCTAssertTrue(productListView.coordinator === coordinator)
    }
}
