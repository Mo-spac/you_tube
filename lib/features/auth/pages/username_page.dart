import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:you_tube/core/widgets/flat_button.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValidate = true;

  void validateUsername() async {
    final userMap = await FirebaseFirestore.instance.collection("Users").get();

    final users = userMap.docs.map((user) => user).toList();
    String? targeredUsername;

    for (var user in users) {
      if (usernameController.text == user.data()["username"]) {
        targeredUsername = user.data()["username"];
        isValidate = false;
        setState(() {});
      }
      if (usernameController.text != targeredUsername) {
        isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 26, horizontal: 14),
              child: Text(
                "Enter the Username",
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Form(
                child: TextFormField(
                  onChanged: (username) {
                    validateUsername();
                  },
                  autovalidateMode: AutovalidateMode.always,
                  validator: (username) {},
                  key: formKey,
                  controller: usernameController,
                  decoration: InputDecoration(
                    suffixIcon: isValidate
                        ? Icon(Icons.verified_user_rounded)
                        : Icon(Icons.cancel),
                    suffixIconColor: isValidate ? Colors.green : Colors.red,
                    hintText: "Insery Username",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
              child: FlatButton(
                text: "CONTINUE",
                onPressed: () {
                  // add user data inside database
                },
                colour: isValidate ? Colors.green : Colors.green.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
