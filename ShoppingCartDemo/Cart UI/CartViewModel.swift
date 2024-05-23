import Foundation

class CartViewModel: ObservableObject {
    private let repository: CartRepository
    @Published var cartItems: [CartItem] = []

    init(repository: CartRepository) {
        self.repository = repository
        loadCartItems()
    }

    private func loadCartItems() {
        self.cartItems = repository.getCartItems()
    }

    func addToCart(product: Product) {
        let item = CartItem(product: product, quantity: 1)
        repository.addCartItem(item)
        loadCartItems()
    }

    func removeFromCart(item: CartItem) {
        repository.removeCartItem(item)
        loadCartItems()
    }
}
