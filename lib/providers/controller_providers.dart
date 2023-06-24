import 'package:flutter_app/features/cart/controller/cart_item_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service_providers.dart';

final shoppingCartItemControllerProvider =
    StateNotifierProvider<ShoppingCartItemController, AsyncValue<void>>((ref) {
  return ShoppingCartItemController(
    cartService: ref.read(cartServiceProvider),
  );
});
