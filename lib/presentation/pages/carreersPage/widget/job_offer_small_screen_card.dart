import 'package:flutter/cupertino.dart';
import 'package:ohana_webapp_flutter/presentation/constants/regex_controller.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class JobOfferSmallScreenCard extends StatelessWidget {
  const JobOfferSmallScreenCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.keywords});

  final String title;
  final String imagePath;
  final List<String> keywords;

  @override
  Widget build(BuildContext context) {
    const Color color = Color(0xffD9D9D9);
    const double boxWidth = 400.0;
    const EdgeInsets padding =
        EdgeInsets.only(left: 10, right: 10, top: 5.0, bottom: 5.0);
    const EdgeInsets margin = EdgeInsets.only(bottom: 5.0);
    //responsive item
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        width: boxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath != '' && imagePath != null
                  ? imagePath
                  : jobDefaultImage,
              height: 250,
              width: boxWidth,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Wrap(
              // keys Words of this Job
              alignment: WrapAlignment.start,
              spacing: 10,
              children: [
                for (String item in keywords)
                  if (item != '' && item != null)
                    Container(
                      color: color,
                      padding: padding,
                      margin: margin,
                      child: Text(item),
                    ),
              ],
            ),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.centerRight,
                child: Button(
                  'Voir Plus',
                  type: ButtonType.standard,
                  onTap: () {},
                  paddingLeftRight: 10,
                  paddingTopBottom: 10,
                ))
          ],
        ),
      ),
    );
  }
}

_getJobItem({required String title, required String imagePath}) {}
