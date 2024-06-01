import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/logo.dart';

class NavigationBarContents extends StatelessWidget {
  const NavigationBarContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [const Logo(), _navBarItems(context)],
    );
  }

  Row _navBarItems(BuildContext context) {
    return Row(
      children: [
        Button(
          "EXPERTISES",
          type: ButtonType.navbar,
          onTap: () {},
        ),
        const SizedBox(width: 2),
        Button(
          "OFFRES",
          type: ButtonType.navbar,
          onTap: () {},
        ),
        const SizedBox(width: 2),
        Button(
          "NOUS CONNAITRE",
          type: ButtonType.navbar,
          onTap: () {},
        ),
        const SizedBox(width: 2),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search, size: 30)),
        const SizedBox(width: 8),
        Button(
          "CONTACT",
          type: ButtonType.standard,
          onTap: () {
            Navigator.of(context).pushNamed(contactUs);
          },
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
