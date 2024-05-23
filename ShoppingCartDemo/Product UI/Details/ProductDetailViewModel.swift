//
//  File.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    private let cartRepository: CartRepository

    init(product: Product, cartRepository: CartRepository) {
        self.product = product
        self.cartRepository = cartRepository
    }

    func addToCart() {
        let cartI = CartItem(product: product, quantity: 1)
        cartRepository.addCartItem(cartI)
    }
}
