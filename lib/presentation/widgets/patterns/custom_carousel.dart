import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel(
      {super.key,
      required this.widgets,
      this.animationDuration = 4,
      this.carouselHeight = 316,
      this.viewportFraction = 0.3,
      this.title = '',
      this.color = const Color(0xFFD9D9D9),
      this.paddingLeftRight = 0,
      this.paddingTopBottom = 0});

  final List<Widget> widgets;
  final int animationDuration;
  final String title;
  final double carouselHeight;
  final Color color;
  final double viewportFraction;
  final double paddingLeftRight;
  final double paddingTopBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != '')
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: spaceLeftBigTitle,
              ),
              CustomUnderlineTitle(title: title),
            ],
          ),
        if (title != '')
          const SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
        Container(
          color: color,
          padding: EdgeInsets.only(
            left: paddingLeftRight,
            top: paddingTopBottom,
            right: paddingLeftRight,
            bottom: paddingTopBottom,
          ),
          child: CarouselSlider(
              items: widgets,
              options: CarouselOptions(
                  initialPage: 0,
                  height: carouselHeight,
                  viewportFraction: viewportFraction,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: animationDuration))),
        ),
      ],
    );
  }
}
