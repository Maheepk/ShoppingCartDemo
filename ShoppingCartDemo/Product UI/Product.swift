//
//  File.swift
//  
//
//  Created by Maheep on 18/05/24.
//

import Foundation

public struct Product: Identifiable, Codable, Equatable {
    public let id: UUID
    public let name: String
    public let category: Category
    public let price: Double
    public let imageName: String
    
    public init(id: UUID = UUID(), name: String, category: Category, price: Double, imageName: String) {
        self.id = id
        self.name = name
        self.category = category
        self.price = price
        self.imageName = imageName
    }
}

public enum Category: Codable, CaseIterable {
    case all
    case electronic
    case furniture
    
    public var description: String {
        switch self {
        case .all:
            return "All"
        case .electronic:
            return "Electronic"
        case .furniture:
            return "Furniture"
        }
    }
}
