import 'package:flutter_app/features/auth/domain/app_user.dart';

abstract class AuthRepository {
  /// returns null if the user is not signed in
  AppUser? get currentUser;

  /// useful to watch auth state changes in realtime
  Stream<AppUser?> authStateChanges();

  // other sign in methods
}
