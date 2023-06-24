import 'package:flutter_app/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPageController extends StateNotifier<AsyncValue<void>> {
  SignInPageController({required this.authRepository})
      : super(const AsyncData(null));
  final FakeAuthRepository authRepository;

  Future<void> signInAnonymously() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(authRepository.signInAnonymously);
  }
}
