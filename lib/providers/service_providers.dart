import 'package:flutter_app/features/cart/application/cart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref);
});
