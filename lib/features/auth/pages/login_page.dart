import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTap: () {},
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
