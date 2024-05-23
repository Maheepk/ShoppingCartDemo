//
//  LocalCartRepository.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import Foundation

public class LocalCartRepository: CartRepository {
    private let storageKey = "cart_items"
    private var cartItems: [CartItem] = []

    public init() {
        loadCartItems()
    }

    public func getCartItems() -> [CartItem] {
        return cartItems
    }

    public func addCartItem(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.product.name == item.product.name }) {
            cartItems[index].quantity += item.quantity
        } else {
            cartItems.append(item)
        }
        saveCartItems()
    }

    public func removeCartItem(_ item: CartItem) {
        cartItems.removeAll { $0.id == item.id }
        saveCartItems()
    }

    public func clearCart() {
        cartItems.removeAll()
        saveCartItems()
    }

    private func saveCartItems() {
        let data = try? JSONEncoder().encode(cartItems)
        UserDefaults.standard.setValue(data, forKey: storageKey)
    }

    private func loadCartItems() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let items = try? JSONDecoder().decode([CartItem].self, from: data) else {
            cartItems = []
            return
        }
        cartItems = items
    }
}
