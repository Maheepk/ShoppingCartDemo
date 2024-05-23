//
//  LocalProductRepositoryTests.swift
//  ShoppingCartDemoTests
//
//  Created by Maheep on 18/05/24.
//

import XCTest

class LocalProductRepositoryTests: XCTestCase {
    
    var repository: LocalProductRepository!

    override func setUp() {
        super.setUp()
        repository = LocalProductRepository()
    }

    override func tearDown() {
        repository = nil
        super.tearDown()
    }

    func testFetchProducts() {
        let products = repository.fetchProducts()
        
        // Ensure that the correct number of products is fetched
        XCTAssertEqual(products.count, 6)
        
        // Test individual product properties
        XCTAssertEqual(products[0].name, "Microwave Oven")
        XCTAssertEqual(products[0].category, .electronic)
        XCTAssertEqual(products[0].price, 299)
        XCTAssertEqual(products[0].imageName, "microwave")
        
        XCTAssertEqual(products[1].name, "Television")
        XCTAssertEqual(products[1].category, .electronic)
        XCTAssertEqual(products[1].price, 799)
        XCTAssertEqual(products[1].imageName, "television")
        
        XCTAssertEqual(products[2].name, "Vacuum Cleaner")
        XCTAssertEqual(products[2].category, .electronic)
        XCTAssertEqual(products[2].price, 199)
        XCTAssertEqual(products[2].imageName, "vacuum")
        
        XCTAssertEqual(products[3].name, "Table")
        XCTAssertEqual(products[3].category, .furniture)
        XCTAssertEqual(products[3].price, 149)
        XCTAssertEqual(products[3].imageName, "table")
        
        XCTAssertEqual(products[4].name, "Chair")
        XCTAssertEqual(products[4].category, .furniture)
        XCTAssertEqual(products[4].price, 49)
        XCTAssertEqual(products[4].imageName, "chair")
        
        XCTAssertEqual(products[5].name, "Almirah")
        XCTAssertEqual(products[5].category, .furniture)
        XCTAssertEqual(products[5].price, 399)
        XCTAssertEqual(products[5].imageName, "almirah")
    }
}
