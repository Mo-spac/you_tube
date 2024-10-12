import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/core/widgets/flat_button.dart';
import 'package:you_tube/features/auth/repository/user_data_service.dart';

final formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilPic;
  final String email;

  const UsernamePage({
    required this.displayName,
    required this.profilPic,
    required this.email,
    super.key,
  });

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
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
                  validator: (username) {
                    return isValidate ? null : "Username already taken";
                  },
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
                onPressed: () async {
                  // add user data inside database

                  isValidate
                      ? await ref
                          .read(userDataServiceProvider)
                          .addUserDataToFireStore(
                            displayName: widget.displayName,
                            username: usernameController.text,
                            email: widget.email,
                            profilePic: widget.profilPic,
                            description: "",
                          )
                      : null;
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
