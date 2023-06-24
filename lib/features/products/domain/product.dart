import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.g.dart';
part 'product.freezed.dart';

/// The ProductID is an important concept in our domain
/// so it deserves a type of its own
typedef ProductID = String;

@freezed
class Product with _$Product {
  factory Product({
    required String id,
    required String imageUrl,
    required String title,
    required double price,
    required int availableQuantity,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
