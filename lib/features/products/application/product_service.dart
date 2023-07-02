import 'package:flutter_app/features/products/domain/product.dart';

abstract class ProductService {
  Future<List<Product>> getProducts(int currentPage, int pageSize);
}
