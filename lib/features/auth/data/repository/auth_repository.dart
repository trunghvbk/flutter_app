import 'package:flutter_app/features/auth/domain/app_user.dart';
import 'package:flutter_app/utils/in_memory_store.dart';

class FakeAuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  Future<void> signInAnonymously() async {
    await Future.delayed(const Duration(seconds: 3));
    _authState.value = AppUser(
      uid: '123', // TODO: make it unique
    );
  }

  Future<void> signOut() async {
    _authState.value = null;
  }

  void dispose() => _authState.close();
}
