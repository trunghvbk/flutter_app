import 'package:flutter/material.dart';
import 'package:flutter_app/providers/controller_providers.dart';
import 'package:flutter_app/utils/async_value_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      signInPageControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final state = ref.watch(signInPageControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: state.isLoading
                ? null
                : () => ref
                    .read(signInPageControllerProvider.notifier)
                    .signInAnonymously(),
            child: state.isLoading
                ? const CircularProgressIndicator()
                : const Text('Sign in anonymously'),
          ),
        ),
      ),
    );
  }
}
