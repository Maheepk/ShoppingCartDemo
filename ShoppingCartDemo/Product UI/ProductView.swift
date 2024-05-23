//
//  File.swift
//  
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

struct ProductView: View {
    
    private let product: Product
    private let onSelected: (Product) -> Void
    
    internal init(product: Product, onSelected: @escaping (Product) -> Void) {
        self.product = product
        self.onSelected = onSelected
    }
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: product.imageName)
                    .frame(height: 350)
            }
            .frame(height: 350)
            Divider()
            VStack {
                Text(product.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                HStack {
                    Text("$\(product.price)")
                }
                
                Button(action: {
                    onSelected(product)
                }) {
                    Text("Add to Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}
