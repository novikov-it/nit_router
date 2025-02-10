import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/auth_state.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This page is not available while signedIn'),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () => ref.read(authStateProvider.notifier).signIn(),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
