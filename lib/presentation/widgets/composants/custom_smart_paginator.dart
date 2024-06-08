import 'package:flutter/cupertino.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';

class CustomSmartPaginator extends StatelessWidget {
  const CustomSmartPaginator(
      {super.key,
      required this.startIndicator,
      required this.endIndicator,
      required this.onTap});
  final int startIndicator;
  final int endIndicator;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        Button(
          '<<',
          type: ButtonType.number,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        Button(
          '...',
          type: ButtonType.number,
          onTap: () {},
        ),
        for (var i = startIndicator; i <= endIndicator; i++)
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Button(
                i.toString(),
                type: ButtonType.number,
                onTap: () {
                  onTap();
                },
              )),
        Button(
          '...',
          type: ButtonType.number,
          onTap: () {},
        ),
        const SizedBox(width: 10),
        Button(
          '>>',
          type: ButtonType.number,
          onTap: () {},
        ),
      ],
    );
  }
}
