import 'package:flutter_app/features/auth/presentation/account_page_controller.dart';
import 'package:flutter_app/features/auth/presentation/sign_in_page_controller.dart';
import 'package:flutter_app/features/cart/controller/cart_item_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository_providers.dart';
import 'service_providers.dart';

final shoppingCartItemControllerProvider =
    StateNotifierProvider<ShoppingCartItemController, AsyncValue<void>>((ref) {
  return ShoppingCartItemController(
    cartService: ref.read(cartServiceProvider),
  );
});

final accountPageControllerProvider =
    StateNotifierProvider.autoDispose<AccountPageController, AsyncValue<void>>(
        (ref) {
  return AccountPageController(
    authRepository: ref.watch(authRepositoryProvider),
  );
});

final signInPageControllerProvider =
    StateNotifierProvider.autoDispose<SignInPageController, AsyncValue<void>>(
        (ref) {
  return SignInPageController(
    authRepository: ref.watch(authRepositoryProvider),
  );
});
