import 'package:flutter_app/features/cart/application/cart_service.dart';
import 'package:flutter_app/features/cart/domain/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingCartItemController extends StateNotifier<AsyncValue<void>> {
  ShoppingCartItemController({required this.cartService})
      : super(const AsyncData(null));
  final CartService cartService;

  Future<void> updateQuantity(CartItem item, int quantity) async {
    // set loading state
    state = const AsyncLoading();
    // create an updated Item with the new quantity
    final updated = CartItem(productID: item.productID, quantity: quantity);
    // use the cartService to update the cart
    // and set the state again (data or error)
    state = await AsyncValue.guard(
      () => cartService.addItem(updated),
    );
  }

  Future<void> deleteItem(CartItem item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => cartService.removeItemById(item.productID),
    );
  }
}
