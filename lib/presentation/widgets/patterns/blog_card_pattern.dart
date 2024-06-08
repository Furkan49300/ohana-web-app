import 'package:flutter/cupertino.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/blog_card.dart';

class BlogCardPattern extends StatelessWidget {
  final List<Map> blogList;
  final double cardWidth;
  const BlogCardPattern(
      {super.key, required this.blogList, this.cardWidth = 422});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Wrap(
          spacing: 50, //horizontal space between widgets
          children: blogList
              .map((item) => Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BlogCard(
                      title: item['title'],
                      pathOfTopImage: item['imagePath'],
                      date: item['date'],
                      textAndBoldListMap: {
                        'text': item['text'],
                        'boldTextList': item['boldTextList']
                      },
                      width: cardWidth,
                    ),
                  ))
              .toList()),
    );
  }
}
