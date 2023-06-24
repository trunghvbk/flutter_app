import 'package:flutter_app/features/cart/domain/cart.dart';

abstract class LocalCartRepository {
  // get the cart value (read-once)
  Future<Cart> fetchCart();

  // get the cart value (realtime updates)
  Stream<Cart> watchCart();

  // set the cart value
  Future<void> setCart(Cart cart);
}
