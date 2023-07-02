import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/network.dart';

import 'services/product_service.dart';

final magentoProductService = Provider<MProductService>((ref) {
  final apiRepo = ref.read(apiRepoProvider);
  return MProductService(apiRepo);
});
