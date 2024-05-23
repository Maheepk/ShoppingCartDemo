//
//  RetailApp.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

@main
struct RetailApp: App {
    @StateObject var coordinator = MainCoordinator()

    var body: some Scene {
        WindowGroup {
            TabView {
                coordinator.backToProductList()
                    .tabItem {
                        Label("Products", systemImage: "list.bullet")
                    }

                coordinator.showCart()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
            .environmentObject(coordinator)
        }
    }
}
