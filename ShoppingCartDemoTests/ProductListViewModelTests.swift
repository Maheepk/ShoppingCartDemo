//
//  ProductListViewModelTests.swift
//  ShoppingCartDemoTests
//
//  Created by Maheep on 18/05/24.
//

import XCTest

import XCTest

class ProductListViewModelTests: XCTestCase {
    
    func testLoadProducts() {
        // Given
        let mockRepository = MockProductRepository()
        let viewModel = ProductListViewModel(repository: mockRepository)
        
        
        // Then
        XCTAssertEqual(viewModel.products.count, mockRepository.mockProducts.count)
        XCTAssertEqual(viewModel.products, mockRepository.mockProducts)
    }
    
    func testUpdateProducts() {
        // Given
        let mockRepository = MockProductRepository()
        let viewModel = ProductListViewModel(repository: mockRepository)
        
        // When
        viewModel.updateProducts(from: Category.all.description)
        
        // Then
        XCTAssertEqual(viewModel.products.count, mockRepository.mockProducts.count)
        XCTAssertEqual(viewModel.products, mockRepository.mockProducts)
        
        // Given
        let category = "Electronics"
        
        // When
        viewModel.updateProducts(from: category)
        
        // Then
        XCTAssertEqual(viewModel.products.count, mockRepository.mockProducts.filter { $0.category.description == category }.count)
        XCTAssertEqual(viewModel.products, mockRepository.mockProducts.filter { $0.category.description == category })
    }
}

class MockProductRepository: ProductRepository {
    var mockProducts: [Product] = [
        Product(name: "Product1", category: .electronic, price: 100, imageName: "image1"),
        Product(name: "Product2", category: .furniture, price: 200, imageName: "image2"),
        Product(name: "Product3", category: .all, price: 50, imageName: "image3")
    ]
    
    func fetchProducts() -> [Product] {
        return mockProducts
    }
}
