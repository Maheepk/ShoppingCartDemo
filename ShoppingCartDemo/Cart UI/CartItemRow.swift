import SwiftUI

struct CartItemRow: View {
    let item: CartItem

    var body: some View {
        HStack {
            Image(item.product.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(item.product.name)
            Spacer()
            Text("\(item.quantity) x $\(item.product.price, specifier: "%.2f")")
        }
    }
}
