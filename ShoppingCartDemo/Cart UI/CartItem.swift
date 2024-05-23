//
//  File.swift
//  
//
//  Created by Maheep on 18/05/24.
//

import Foundation

public struct CartItem: Identifiable, Codable {
    public let id: UUID
    public let product: Product
    public var quantity: Int

    public init(id: UUID = UUID(), product: Product, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}
