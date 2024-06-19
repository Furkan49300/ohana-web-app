import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel(
      {super.key,
      required this.widgets,
      this.animationDuration = 4,
      this.carouselHeight,
      this.viewportFraction = 0.3,
      this.title = '',
      this.autoPlay = true});
  final List<Widget> widgets;
  final int animationDuration;
  final String title;
  final bool autoPlay;
  final double? carouselHeight;
  final double viewportFraction;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 912) {
        return _getCustomCarouselSlider(
          viewport: 1,
        );
      } else {
        return _getCustomCarouselSlider(
          viewport: viewportFraction,
          carouselHeight: carouselHeight,
        );
      }
    });
  }

  _getCustomCarouselSlider(
      {required double viewport, double? titleWidth, double? carouselHeight}) {
    return Column(
      children: [
        if (title != '')
          Center(
            child: CustomUnderlineTitle(
              title: title,
              textWidth: titleWidth,
            ),
          ),
        if (title != '')
          const SizedBox(
            height: spaceBetweenBigTitleAndTextBody,
          ),
        CarouselSlider(
            items: widgets,
            options: CarouselOptions(
                initialPage: 0,
                height: carouselHeight,
                viewportFraction: viewport,
                autoPlay: autoPlay,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: animationDuration))),
      ],
    );
  }
}
