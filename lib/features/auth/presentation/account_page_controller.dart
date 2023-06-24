import 'package:flutter_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_app/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPageController extends StateNotifier<AsyncValue<void>> {
  AccountPageController({required this.authRepository})
      : super(const AsyncData(null));
  final FakeAuthRepository authRepository;

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(authRepository.signOut);
  }
}
