import 'package:flutter/material.dart';
import 'package:flutter_app/features/auth/presentation/account_page.dart';
import 'package:flutter_app/features/auth/presentation/sign_in_page.dart';
import 'package:flutter_app/providers/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangesProvider);
    return authState.maybeWhen(
      data: (user) => user != null ? const AccountPage() : const SignInPage(),
      // TODO: Should also handle errors
      orElse: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
