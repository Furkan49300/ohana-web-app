import 'package:flutter/material.dart';

class CircularImageLoader extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;

  const CircularImageLoader({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
  });

  Future<void> _loadImage(BuildContext context) async {
    // Simulate some delay
    await Future.delayed(Duration(seconds: 2));
    // Preload the image
    await precacheImage(AssetImage(imagePath), context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadImage(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text(
            'Error loading image',
            style: TextStyle(color: Colors.red),
          );
        } else {
          return Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        }
      },
    );
  }
}
