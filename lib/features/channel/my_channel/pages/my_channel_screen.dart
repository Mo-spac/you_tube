import 'package:flutter/material.dart';
import 'package:you_tube/core/colors.dart';
import 'package:you_tube/core/widgets/image_button.dart';

class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                        TextSpan(text: "@mosa3715.com   "),
                        TextSpan(text: "No subscribtions   "),
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
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: TabBar(
                    isScrollable: true,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(top: 12),
                    tabs: [
                      Text("Home"),
                      Text("Videos"),
                      Text("shorts"),
                      Text("community"),
                      Text("playlists"),
                      Text("channels"),
                      Text("about"),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    Center(
                      child: Text("Home"),
                    ),
                    Center(
                      child: Text("Videos"),
                    ),
                    Center(
                      child: Text("shorts"),
                    ),
                    Center(
                      child: Text("community"),
                    ),
                    Center(
                      child: Text("playlists"),
                    ),
                    Center(
                      child: Text("channel"),
                    ),
                    Center(
                      child: Text("about"),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
