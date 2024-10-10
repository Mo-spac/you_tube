import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/features/auth/repository/auth_service.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 25,
              ),
              child: Image.asset(
                "assets/images/youtube-signin.jpg",
                height: 140,
              ),
            ),
            Text(
              "Welcome To YouTube",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: GestureDetector(
                onTap: () async {
                  await ref.read(authServiceProvider).signInWithGoogle();
                },
                child: Image.asset(
                  "assets/images/signinwithgoogle.png",
                  height: 50,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
