import 'package:flutter/material.dart';
import 'package:you_tube/features/channel/my_channel/wedgits/setting_field_item.dart';

class MyChannelSetting extends StatefulWidget {
  const MyChannelSetting({super.key});

  @override
  State<MyChannelSetting> createState() => _MyChannelSettingState();
}

class _MyChannelSettingState extends State<MyChannelSetting> {
  bool isSwiched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onPressed: () {},
                value: "Moooooooo",
              ),
              SizedBox(height: 14),
              SettingFieldItem(
                identifier: "Handle",
                onPressed: () {},
                value: "@mosa-2155",
              ),
              SizedBox(height: 14),
              SettingFieldItem(
                identifier: "Description",
                onPressed: () {},
                value: "",
              ),

              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
    );
  }
}
