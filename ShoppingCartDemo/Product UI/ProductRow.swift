//
//  ProductRow.swift
//  ShoppingCartDemo
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack {
            Image(product.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(product.name)
            Spacer()
            Text("$\(product.price, specifier: "%.2f")")
        }
    }
}
