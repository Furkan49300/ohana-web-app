import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_icon_button.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomIconButton(iconPath: "assets/social_media_icons/facebook.svg"),
        CustomIconButton(iconPath: "assets/social_media_icons/twitter.svg"),
        CustomIconButton(iconPath: "assets/social_media_icons/linkedin.svg"),
      ],
    );
  }
}
