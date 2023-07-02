import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    required String id,
    required String imageUrl,
    required String title,
    required double price,
    required int availableQuantity,
  }) = _Product;
}
