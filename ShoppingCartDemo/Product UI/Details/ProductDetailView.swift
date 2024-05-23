//
//  ProductDetailView.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel
    var coordinator: MainCoordinator

    var body: some View {
        VStack {
            Image(viewModel.product.imageName)
                .resizable()
                .frame(width: 200, height: 200)
            Text(viewModel.product.name)
                .font(.title)
            Text("$\(viewModel.product.price, specifier: "%.2f")")
                .font(.title2)
            Button {
                coordinator.cartViewModel.addToCart(product: viewModel.product)
            } label: {
                Text("Add to Cart")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .navigationBarTitle(viewModel.product.name, displayMode: .inline)
    }
}
