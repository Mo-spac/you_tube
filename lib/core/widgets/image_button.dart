import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:you_tube/core/colors.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String image;
  final bool haveColor;
  const ImageButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.haveColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Container(
          padding: const EdgeInsets.only(top: 7.6, bottom: 7.6),
          decoration: BoxDecoration(
            color: haveColor ? softBlueGreyBackGround : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Image.asset(
            "assets/icons/$image",
            height: 23,
          ),
        ),
      ),
    );
  }
}
