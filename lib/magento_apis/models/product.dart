import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_app/features/products/domain/product.dart' as product;

part 'product.g.dart';

@JsonSerializable()
class MProduct {
  int id;
  String? sku;
  String? name;
  double? price;
  int? status;
  int? visibility;
  ProductType? typeId;
  double? weight;
  List<CustomAttribute> customAttributes = [];
  List<Map<String, Object>>? mediaGalleryEntries;

  MProduct(
    this.id,
    this.sku,
    this.name,
    this.price,
    this.status,
    this.visibility,
    this.weight,
    this.customAttributes,
    this.mediaGalleryEntries,
  );

  factory MProduct.fromJson(Map<String, dynamic> json) =>
      _$MProductFromJson(json);
}

enum ProductType {
  configurable,
  simple,
  bundle,
  grouped,
  downloadable,
  virtual
}

@JsonSerializable()
class CustomAttribute {
  String code;
  Object value;
  CustomAttribute({
    required this.code,
    required this.value,
  });

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      _$CustomAttributeFromJson(json);
}

extension ProductX on MProduct {
  product.Product toData() => product.Product(
      id: '$id',
      imageUrl: '',
      title: name ?? '',
      price: price ?? 0,
      availableQuantity: 1);
}
