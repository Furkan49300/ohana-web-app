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
      this.paddingTopBottom = 0,
      this.autoPlay = true});
  final List<Widget> widgets;
  final int animationDuration;
  final String title;
  final bool autoPlay;
  final double? carouselHeight;
  final Color color;
  final double viewportFraction;
  final double paddingLeftRight;
  final double paddingTopBottom;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < smallBreakpoint) {
        return _getCustomCarouselSlider(
          viewport: 1,
          titleWidth: constraints.maxWidth - 400,
        );
      } else {
        return _getCustomCarouselSlider(
          viewport: viewportFraction,
        );
      }
    });
  }

  _getCustomCarouselSlider({
    required double viewport,
    double? titleWidth,
  }) {
    return Column(
      children: [
        if (title != '')
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: spaceLeftBigTitle,
              ),
              CustomUnderlineTitle(
                title: title,
                textWidth: titleWidth,
              ),
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
                  viewportFraction: viewport,
                  autoPlay: autoPlay,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: animationDuration))),
        ),
      ],
    );
  }
}
