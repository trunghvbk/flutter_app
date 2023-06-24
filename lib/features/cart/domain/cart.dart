import '../../products/domain/product.dart';

class Cart {
  const Cart([this.items = const {}]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final Map<ProductID, int> items;
}

/// Helper extension used to update the items in the shopping cart.
extension MutableCart on Cart {
  Cart addItem({required ProductID productId, required int quantity}) {
    final copy = Map<ProductID, int>.from(items);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy[productId] = quantity + (copy[productId] ?? 0);
    return Cart(copy);
  }

  Cart removeItemById(ProductID productId) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productId);
    return Cart(copy);
  }
}
