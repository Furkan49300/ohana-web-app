import "package:google_fonts/google_fonts.dart";
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner(
      {super.key,
      this.message = '',
      required this.imagePath,
      this.textColor = Colors.white,
      this.widget,
      this.alignement = Alignment.center});

  final String message;
  final Color? textColor;
  final String imagePath;
  final Widget? widget;
  final Alignment alignement;

  @override
  Widget build(BuildContext context) {
    Size mediaScreenSize = MediaQuery.of(context).size;
    double containerHeight = mediaScreenSize.height / 1.5;

    return Stack(
      alignment: alignement,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: containerHeight,
          width: mediaScreenSize.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            //fit the height of container
          ),
        ),
        widget ??
            SizedBox(
              height: containerHeight, //Container Height
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  message,
                  style: GoogleFonts.majorMonoDisplay(
                      color: textColor, fontSize: 40),
                ),
              ),
            ),
      ],
    );
  }
}
