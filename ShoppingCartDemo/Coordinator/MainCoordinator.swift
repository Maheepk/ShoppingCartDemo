//
//  MainCoordinator.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

class MainCoordinator: ObservableObject {
    private var productRepository: ProductRepository
    private var cartRepository: CartRepository

    @Published var productListViewModel: ProductListViewModel
    @Published var cartViewModel: CartViewModel

    init() {
        // Initialize repositories
        self.productRepository = LocalProductRepository()
        self.cartRepository = LocalCartRepository()
        
        // Initialize view models
        self.productListViewModel = ProductListViewModel(repository: productRepository)
        self.cartViewModel = CartViewModel(repository: cartRepository)
    }

    func showProductDetails(product: Product) -> ProductDetailView {
        let productDetailViewModel = ProductDetailViewModel(product: product, cartRepository: cartRepository)
        return ProductDetailView(viewModel: productDetailViewModel, coordinator: self)
    }

    func showCart() -> CartView {
        CartView(viewModel: cartViewModel, coordinator: self)
    }

    func backToProductList() -> ProductListView {
        ProductListView(viewModel: productListViewModel, coordinator: self)
    }
}
