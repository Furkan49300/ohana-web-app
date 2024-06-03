import "package:google_fonts/google_fonts.dart";
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    this.message = '',
    required this.imagePath,
  });

  final String message;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    Size mediaScreenSize = MediaQuery.of(context).size;
    double containerHeight = mediaScreenSize.height / 2;

    return Stack(
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
        SizedBox(
          height: containerHeight, //Container Height
          child: Align(
            alignment: Alignment.center,
            child: Text(
              message,
              style: GoogleFonts.majorMonoDisplay(
                  color: Colors.white, fontSize: 40),
            ),
          ),
        ),
      ],
    );
  }
}
