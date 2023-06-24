import 'package:flutter/material.dart';
import 'package:flutter_app/providers/controller_providers.dart';
import 'package:flutter_app/utils/async_value_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple account screen showing some user info and a logout button.
class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      accountPageControllerProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final state = ref.watch(accountPageControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: state.isLoading
            ? const CircularProgressIndicator()
            : const Text('Account'),
        actions: [
          TextButton(
            onPressed: state.isLoading
                ? null
                : () async {
                    ref.read(accountPageControllerProvider.notifier).signOut();
                  },
            child: Text(
              'Logout',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
