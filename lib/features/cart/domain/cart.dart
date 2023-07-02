import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    required Map<String, int> items,
  }) = _Cart;
}

/// Helper extension used to update the items in the shopping cart.
extension MutableCart on Cart {
  Cart addItem(CartItem item) {
    final copy = Map<String, int>.from(items);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy[item.productID] = item.quantity + (copy[item.productID] ?? 0);
    return Cart(items: copy);
  }

  Cart removeItemById(String productId) {
    final copy = Map<String, int>.from(items);
    copy.remove(productId);
    return Cart(items: copy);
  }

  Cart setItem(CartItem item) {
    final copy = Map<String, int>.from(items);
    copy[item.productID] = item.quantity;
    return Cart(items: copy);
  }
}

class CartItem {
  final String productID;
  final int quantity;

  CartItem({required this.productID, required this.quantity});
}
