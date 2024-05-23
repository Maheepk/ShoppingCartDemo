//
//  CartViewModelTests.swift
//  ShoppingCartDemoTests
//
//  Created by Maheep on 18/05/24.
//

import XCTest

class CartViewModelTests: XCTestCase {
    
    var viewModel: CartViewModel!
    var mockRepository: MockCartRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockCartRepository()
        viewModel = CartViewModel(repository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testAddToCart() {
        let product = Product(name: "Test Product", category: .electronic, price: 10.0, imageName: "image")
        viewModel.addToCart(product: product)
        
        XCTAssertEqual(mockRepository.addCartItemCallCount, 1)
        XCTAssertEqual(mockRepository.addedCartItem?.product.name, product.name)
        XCTAssertEqual(mockRepository.addedCartItem?.quantity, 1)
    }
    
    func testRemoveFromCart() {
        let item = CartItem(product: Product(name: "Test Product", category: .electronic, price: 10.0, imageName: "image"), quantity: 2)
        viewModel.removeFromCart(item: item)
        
        XCTAssertEqual(mockRepository.removeCartItemCallCount, 1)
        XCTAssertEqual(mockRepository.removedCartItem?.id, item.id)
    }
}

class MockCartRepository: CartRepository {
    var addCartItemCallCount = 0
    var addedCartItem: CartItem?
    var removeCartItemCallCount = 0
    var removedCartItem: CartItem?
    
    func getCartItems() -> [CartItem] {
        return []
    }
    
    func addCartItem(_ item: CartItem) {
        addCartItemCallCount += 1
        addedCartItem = item
    }
    
    func removeCartItem(_ item: CartItem) {
        removeCartItemCallCount += 1
        removedCartItem = item
    }
    
    func clearCart() {}
}
