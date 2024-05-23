//
//  LocalCartRepositoryTests.swift
//  ShoppingCartDemoTests
//
//  Created by Maheep on 18/05/24.
//

import XCTest

class LocalCartRepositoryTests: XCTestCase {
    
    var repository: LocalCartRepository!

    override func setUp() {
        super.setUp()
        repository = LocalCartRepository()
        repository.clearCart()
    }

    override func tearDown() {
        repository.clearCart()
        repository = nil
        super.tearDown()
    }

    func testAddCartItem() {
        let initialCount = repository.getCartItems().count
        
        let item = CartItem(product: Product(name: "Test Product", category: .electronic, price: 10.0, imageName: "image"), quantity: 2)
        repository.addCartItem(item)
        
        XCTAssertEqual(repository.getCartItems().count, initialCount + 1)
    }
    
    func testRemoveCartItem() {
        let item = CartItem(product: Product(name: "Test Product", category: .electronic, price: 10.0, imageName: "image"), quantity: 2)
        repository.addCartItem(item)
        
        let initialCount = repository.getCartItems().count
        repository.removeCartItem(item)
        
        XCTAssertEqual(repository.getCartItems().count, initialCount - 1)
    }
    
    func testClearCart() {
        repository.addCartItem(CartItem(product: Product(name: "Test Product", category: .electronic, price: 10.0, imageName: "image"), quantity: 2))
        repository.addCartItem(CartItem(product: Product(name: "Another Product", category: .electronic, price: 20.0, imageName: "image"), quantity: 1))
        
        repository.clearCart()
        
        XCTAssertEqual(repository.getCartItems().count, 0)
    }
    
    func testPersistence() {
        let item = CartItem(product: Product(name: "Test Product", category: .electronic, price: 10.0, imageName: "image"), quantity: 2)
        repository.addCartItem(item)
        
        let newRepository = LocalCartRepository()
        XCTAssertEqual(newRepository.getCartItems().count, 1)
        XCTAssertEqual(newRepository.getCartItems()[0].id, item.id)
        XCTAssertEqual(newRepository.getCartItems()[0].product.name, item.product.name)
        XCTAssertEqual(newRepository.getCartItems()[0].quantity, item.quantity)
    }
}
