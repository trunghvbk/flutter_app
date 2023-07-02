import 'dart:convert';

import 'package:flutter_app/features/products/domain/product.dart';
import 'package:flutter_app/magento_apis/request.dart';
import 'package:flutter_app/magento_apis/models/product.dart';
import 'package:flutter_app/features/products/application/product_service.dart';
import 'package:network/network.dart';

class MProductService extends ProductService {
  final APIRepository apiRepository;

  MProductService(this.apiRepository);
  @override
  Future<List<Product>> getProducts(int currentPage, int pageSize) async {
    final request = MagentoAPIRequest(
        endPoint: '/products',
        method: HttpMethod.get,
        searchCriterias: [],
        sortCriterias: []);

    return await apiRepository.excute(
        request: request,
        builder: (data) {
          final jsonList = jsonDecode(data) as List<dynamic>;
          return jsonList
              .map((e) => MProduct.fromJson(e as Map<String, dynamic>).toData())
              .toList();
        });
  }
}
