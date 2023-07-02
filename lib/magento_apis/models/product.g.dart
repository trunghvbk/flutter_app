// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MProduct _$MProductFromJson(Map<String, dynamic> json) => MProduct(
      json['id'] as int,
      json['sku'] as String?,
      json['name'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['status'] as int?,
      json['visibility'] as int?,
      (json['weight'] as num?)?.toDouble(),
      (json['customAttributes'] as List<dynamic>)
          .map((e) => CustomAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['mediaGalleryEntries'] as List<dynamic>?)
          ?.map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry(k, e as Object),
              ))
          .toList(),
    )..typeId = $enumDecodeNullable(_$ProductTypeEnumMap, json['typeId']);

Map<String, dynamic> _$MProductToJson(MProduct instance) => <String, dynamic>{
      'id': instance.id,
      'sku': instance.sku,
      'name': instance.name,
      'price': instance.price,
      'status': instance.status,
      'visibility': instance.visibility,
      'typeId': _$ProductTypeEnumMap[instance.typeId],
      'weight': instance.weight,
      'customAttributes': instance.customAttributes,
      'mediaGalleryEntries': instance.mediaGalleryEntries,
    };

const _$ProductTypeEnumMap = {
  ProductType.configurable: 'configurable',
  ProductType.simple: 'simple',
  ProductType.bundle: 'bundle',
  ProductType.grouped: 'grouped',
  ProductType.downloadable: 'downloadable',
  ProductType.virtual: 'virtual',
};

CustomAttribute _$CustomAttributeFromJson(Map<String, dynamic> json) =>
    CustomAttribute(
      code: json['code'] as String,
      value: json['value'] as Object,
    );

Map<String, dynamic> _$CustomAttributeToJson(CustomAttribute instance) =>
    <String, dynamic>{
      'code': instance.code,
      'value': instance.value,
    };
