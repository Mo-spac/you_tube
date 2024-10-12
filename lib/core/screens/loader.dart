import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        color: Colors.blue,
        strokeWidth: 1.8,
      ),
    )
        // Text(
        //   "Something went wrong please try again later",
        //   style: TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        );
  }
}
