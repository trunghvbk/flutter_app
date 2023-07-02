import 'package:flutter_app/features/products/application/product_service.dart';
import 'package:flutter_app/features/products/domain/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListController extends StateNotifier<AsyncValue<List<Product>>> {
  ProductListController({required this.productService})
      : super(const AsyncData([])) {
    loadProducts();
  }
  final ProductService productService;

  Future<void> loadProducts() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => productService.getProducts(0, 100),
    );
  }
}
