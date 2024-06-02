import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/custom_icon_button.dart';

class SocialMediaButtons extends StatelessWidget {
  final bool hoverDisabled;
  final Color primaryColor;
  final MainAxisAlignment mainAxisAlignment;
  const SocialMediaButtons(
      {super.key,
      this.hoverDisabled = false,
      this.primaryColor = Colors.white,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CustomIconButton(
          iconPath: "assets/social_media_icons/facebook.svg",
          hoverDisabled: hoverDisabled,
          primaryColor: primaryColor,
        ),
        CustomIconButton(
          iconPath: "assets/social_media_icons/twitter.svg",
          hoverDisabled: hoverDisabled,
          primaryColor: primaryColor,
        ),
        CustomIconButton(
          iconPath: "assets/social_media_icons/linkedin.svg",
          hoverDisabled: hoverDisabled,
          primaryColor: primaryColor,
        ),
      ],
    );
  }
}
