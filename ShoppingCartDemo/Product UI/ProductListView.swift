//
//  File.swift
//  
//
//  Created by Maheep on 18/05/24.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel
    var coordinator: MainCoordinator
    @State var selectedCategory = Category.all.description
    var allCategory = Category.allCases

    var body: some View {
        NavigationView {
            VStack {
                // Category picker
                Picker("Category", selection: $selectedCategory) {
                    ForEach(allCategory, id: \.self) { category in
                        Text(category.description).tag(category.description)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .accessibilityIdentifier("PickerCategory") // Set accessibility identifier here

                List(viewModel.products) { product in
                    NavigationLink(destination: coordinator.showProductDetails(product: product)) {
                        HStack {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(product.name)
                                Text("$\(product.price, specifier: "%.2f")")
                            }
                            Spacer()
                        }
                    }
                }
            }
            .onChange(of: selectedCategory) { category in
                viewModel.updateProducts(from: category)
            }
            .navigationBarTitle("Products")
        }
    }
}
