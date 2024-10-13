import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 34,
            backgroundColor: Colors.grey,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Text(
            "Mohammed Samy",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                color: Colors.blueGrey,
              ),
              children: [
                TextSpan(text: "@mosa3715.com   "),
                TextSpan(text: "No subscribtions   "),
                TextSpan(text: "No videos"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
