import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network/repository.dart';

final apiRepoProvider = Provider<APIRepository>((ref) {
  return APIRepository();
});
