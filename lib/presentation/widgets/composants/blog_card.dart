import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/bold_text_customiser.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/text_format/custom_underlined_title.dart';

class BlogCard extends StatelessWidget {
  const BlogCard(
      {super.key,
      required this.pathOfTopImage,
      required this.textAndBoldListMap,
      required this.title,
      required this.date});
  final String pathOfTopImage;
  final String title;
  final String date;
  final Map<String, dynamic> textAndBoldListMap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 700,
        width: 422,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey
                  .withOpacity(0.5), // Couleur de l'ombre avec opacité
              spreadRadius: 5, // Rayon de diffusion de l'ombre
              blurRadius: 7, // Rayon de flou de l'ombre
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              pathOfTopImage,
              width: 420,
              height: 340,
              fit: BoxFit.cover,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: BoldTextCustomizer(
                  maxLines: 8,
                  text: textAndBoldListMap['text'],
                  boldTextList: textAndBoldListMap['boldTextList'],
                  isOverflowEllipsis: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

          // Padding(
          //   padding: const EdgeInsets.only(left: 30, right: 30),
          //   child: Text(
          //     '-$date',
          //     style: const TextStyle(fontSize: 20),
          //   ),
          // ),


//"My funny text is start : Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita labore perspiciatis, eaque ducimus nobis molestias blanditiis illum suscipit, deserunt necessitatibus animi dignissimos vero, mollitia facilis repellat vitae. Ipsum, eligendi alias."
