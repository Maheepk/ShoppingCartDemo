import Foundation

public protocol ProductRepository {
    func fetchProducts() -> [Product]
}
