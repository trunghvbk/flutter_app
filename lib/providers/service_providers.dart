import 'package:flutter_app/features/cart/application/cart_service.dart';
import 'package:flutter_app/features/products/application/product_service.dart';
import 'package:flutter_app/magento_apis/services/product_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref);
});

final productServiceProvider = Provider<ProductService>(
    (ref) => MProductService(ref.read(apiRepoProvider)));
