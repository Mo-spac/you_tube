import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/core/screens/error_page.dart';
import 'package:you_tube/core/screens/loader.dart';
import 'package:you_tube/core/widgets/image_button.dart';
import 'package:you_tube/features/auth/provider/user_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/youtube.jpg",
                height: 36,
              ),
              SizedBox(width: 4),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: SizedBox(
                  height: 42,
                  child: ImageButton(
                    image: "cast.png",
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),
              ),
              SizedBox(
                height: 38,
                child: ImageButton(
                  image: "notification.png",
                  onPressed: () {},
                  haveColor: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 15),
                child: SizedBox(
                  height: 41.5,
                  child: ImageButton(
                    image: "search.png",
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ref.watch(currentUserProvider).when(
                        data: (currentUser) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(
                              currentUser.profilePic,
                            ),
                          ),
                        ),
                        error: (error, stackTrace) => const ErrorPage(),
                        loading: () => const Loader(),
                      );
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
