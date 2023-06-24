import 'package:flutter_app/features/cart/domain/cart.dart';

abstract class RemoteCartRepository {
  // get the cart value (read-once)
  Future<Cart> fetchCart(String uid);

  // get the cart value (realtime updates)
  Stream<Cart> watchCart(String uid);

  // set the cart value
  Future<void> setCart(String uid, Cart items);
}
