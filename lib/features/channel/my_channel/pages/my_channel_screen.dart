import 'package:flutter/material.dart';
import 'package:you_tube/core/colors.dart';
import 'package:you_tube/core/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 38),
          child: Column(
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
                      TextSpan(text: "@mosa3715.com"),
                      TextSpan(text: "No subscribtions"),
                      TextSpan(text: "No videos"),
                    ],
                  ),
                ),
              ),
              Text("More about this chennel"),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 41,
                        decoration: BoxDecoration(
                          color: softBlueGreyBackGround,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Manage Videos",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ImageButton(
                        onPressed: () {},
                        image: "pen.png",
                        haveColor: true,
                      ),
                    ),
                    Expanded(
                      child: ImageButton(
                        onPressed: () {},
                        image: "time-watched.png",
                        haveColor: true,
                      ),
                    ),
                  ],
                ),
              ),

              // create Tape bar
            ],
          ),
        ),
      ),
    );
  }
}
