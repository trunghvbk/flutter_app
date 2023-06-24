import 'package:flutter_app/features/cart/domain/cart.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('add item', () {
    test('empty cart - add item', () {
      final cart =
          Cart(items: {}).addItem(CartItem(productID: '1', quantity: 1));
      expect(cart.items, {'1': 1});
    });

    test('empty cart - add two items', () {
      final cart = Cart(items: {})
          .addItem(CartItem(productID: '1', quantity: 1))
          .addItem(CartItem(productID: '2', quantity: 1));
      expect(cart.items, {
        '1': 1,
        '2': 1,
      });
    });

    test('empty cart - add same item twice', () {
      final cart = Cart(items: {})
          .addItem(CartItem(productID: '1', quantity: 1))
          .addItem(CartItem(productID: '1', quantity: 1));
      expect(cart.items, {'1': 2});
    });
  });

  // TODO: Add other function tests
}
