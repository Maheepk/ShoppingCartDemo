//
//  CartView.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    var coordinator: MainCoordinator

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.cartItems) { item in
                        NavigationLink(destination: coordinator.showProductDetails(product: item.product)) {
                            CartItemRow(item: item)
                        }
                    }
                    .onDelete { indices in
                        indices.forEach { index in
                            viewModel.removeFromCart(item: viewModel.cartItems[index])
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
                HStack {
                    Text("Total: $\(viewModel.cartItems.reduce(0) { $0 + $1.product.price * Double($1.quantity) }, specifier: "%.2f")")
                        .font(.title)
                        .padding()
                    Spacer()
                }
            }
            .navigationBarTitle("Cart")
        }
    }
}
