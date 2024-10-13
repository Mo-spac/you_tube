import 'package:flutter/material.dart';
import 'package:you_tube/core/colors.dart';
import 'package:you_tube/core/widgets/image_button.dart';
import 'package:you_tube/features/channel/my_channel/parts/buttons.dart';
import 'package:you_tube/features/channel/my_channel/parts/tab_bar.dart';
import 'package:you_tube/features/channel/my_channel/parts/tab_bar_view.dart';
import 'package:you_tube/features/channel/my_channel/parts/top_header.dart';

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
                // top header
                TopHeader(),
                Text("More about this chennel"),

                Buttons(),

                // create Tape bar
                PageTabBar(),
                TabPages(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
