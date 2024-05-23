// LocalProductRepository.swift
import Foundation

public class LocalProductRepository: ProductRepository {
    public init() {}

    public func fetchProducts() -> [Product] {
        return [
            Product(name: "Microwave Oven", category: .electronic, price: 299, imageName: "microwave"),
            Product(name: "Television", category: .electronic, price: 799, imageName: "television"),
            Product(name: "Vacuum Cleaner", category: .electronic, price: 199, imageName: "vacuum"),
            Product(name: "Table", category: .furniture, price: 149, imageName: "table"),
            Product(name: "Chair", category: .furniture, price: 49, imageName: "chair"),
            Product(name: "Almirah", category: .furniture, price: 399, imageName: "almirah")
        ]
    }
}
