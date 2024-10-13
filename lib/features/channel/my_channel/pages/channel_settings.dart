import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube/core/screens/error_page.dart';
import 'package:you_tube/core/screens/loader.dart';
import 'package:you_tube/features/auth/provider/user_provider.dart';
import 'package:you_tube/features/channel/my_channel/repository/edit_field.dart';
import 'package:you_tube/features/channel/my_channel/wedgits/edit_setting_dialog.dart';
import 'package:you_tube/features/channel/my_channel/wedgits/setting_field_item.dart';

class MyChannelSetting extends ConsumerStatefulWidget {
  const MyChannelSetting({super.key});

  @override
  ConsumerState<MyChannelSetting> createState() => _MyChannelSettingState();
}

class _MyChannelSettingState extends ConsumerState<MyChannelSetting> {
  bool isSwiched = false;
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
        data: (currentUser) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 170,
                            width: double.infinity,
                            child: Image.asset(
                              "assets/images/flutter background.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 160,
                            top: 55,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey,
                              backgroundImage: CachedNetworkImageProvider(
                                currentUser.profilePic,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 10,
                            child: Image.asset(
                              "assets/icons/camera.png",
                              height: 34,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // second part

                      SizedBox(height: 14),
                      SettingFieldItem(
                        identifier: "Name",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Your New Display Name",
                              onSave: (name) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editDisplayName(name);
                              },
                            ),
                          );
                        },
                        value: currentUser.displayName,
                      ),
                      SizedBox(height: 14),
                      SettingFieldItem(
                        identifier: "Handle",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Your New Username",
                              onSave: (username) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editUsername(username);
                              },
                            ),
                          );
                        },
                        value: currentUser.username,
                      ),
                      SizedBox(height: 14),
                      SettingFieldItem(
                        identifier: "Description",
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => SettingsDialog(
                              identifier: "Your New Description",
                              onSave: (description) {
                                ref
                                    .watch(editSettingsProvider)
                                    .editDescription(description);
                              },
                            ),
                          );
                        },
                        value: currentUser.description,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 8, left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Keep all my subscriber private"),
                            Switch(
                              value: isSwiched,
                              onChanged: (value) {
                                isSwiched = value;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Text(
                          "Changes made on your names and profile pictures are visible only to youtube and not other Google Services",
                          style: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        error: (error, StackTrace) => ErrorPage(),
        loading: () => Loader());
  }
}
