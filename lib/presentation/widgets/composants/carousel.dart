import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel(
      {super.key,
      required this.widgets,
      this.animationDuration = 4,
      this.carouselHeight = 316,
      this.viewportFraction = 0.3});
  final List<Widget> widgets;
  final int animationDuration;
  final double carouselHeight;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD9D9D9),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: CarouselSlider(
          items: widgets,
          options: CarouselOptions(
              initialPage: 0,
              height: carouselHeight,
              viewportFraction: viewportFraction,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: animationDuration))),
    );
  }
}
