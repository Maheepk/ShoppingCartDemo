//
//  File.swift
//  
//
//  Created by Maheep on 18/05/24.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
    private let repository: ProductRepository

    init(repository: ProductRepository) {
        self.repository = repository
        loadProducts()
    }

    private func loadProducts() {
        self.products = repository.fetchProducts()
    }

    func updateProducts(from category: String) {
        guard category == Category.all.description else {
            self.products = repository.fetchProducts().filter{ $0.category.description == category }
            return
        }
        self.products = repository.fetchProducts()
    }
}
