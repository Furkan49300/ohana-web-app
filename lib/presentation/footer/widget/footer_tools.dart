import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class FooterLink extends StatefulWidget {
  final String text;
  final String routeName;
  const FooterLink({super.key, required this.text, this.routeName = ""});

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(widget.routeName),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Text(widget.text,
            style: TextStyle(
                fontSize: 15,
                color: _isHovered ? dropDownHoverColor : Colors.white)),
      ),
    );
  }
}

getFooterBottomSection(double screenSizeWidth) {
  return Container(
    height: 40,
    width: screenSizeWidth,
    color: purpleNeutral,
    padding: const EdgeInsets.only(left: 30.0),
    alignment: Alignment.centerLeft,
    child: const Text(
      "Copyright © 2023 - 2024 - Tous droits réservés",
      style: TextStyle(color: Colors.white),
    ),
  );
}

Row getFooterTopItem({
  required IconData icon,
  required String title,
  required String content,
  double size = 45,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: Colors.white,
        size: size,
      ),
      const SizedBox(width: 15),
      RichText(
          text: TextSpan(
              style: GoogleFonts.dmSans(color: Colors.white),
              children: [
            TextSpan(
                text: "$title\n",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextSpan(text: content)
          ]))
    ],
  );
}

getDivider({double height = 80}) {
  return SizedBox(height: height, child: const VerticalDivider());
}
