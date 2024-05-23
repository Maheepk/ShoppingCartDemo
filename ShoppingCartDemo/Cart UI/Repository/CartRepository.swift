import Combine

public protocol CartRepository {
    func getCartItems() -> [CartItem]
    func addCartItem(_ item: CartItem)
    func removeCartItem(_ item: CartItem)
    func clearCart()
}
