import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/core/screens/error_page.dart';
import 'package:you_tube/core/screens/loader.dart';
import 'package:you_tube/features/auth/provider/user_provider.dart';
import 'package:you_tube/features/channel/my_channel/parts/buttons.dart';
import 'package:you_tube/features/channel/my_channel/parts/tab_bar.dart';
import 'package:you_tube/features/channel/my_channel/parts/tab_bar_view.dart';
import 'package:you_tube/features/channel/my_channel/parts/top_header.dart';

class MyChannelScreen extends ConsumerWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          data: (currentUser) => DefaultTabController(
            length: 7,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 38),
                  child: Column(
                    children: [
                      // top header
                      TopHeader(
                        user: currentUser,
                      ),
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
          ),
          error: (error, StackTrace) => ErrorPage(),
          loading: () => Loader(),
        );
  }
}
