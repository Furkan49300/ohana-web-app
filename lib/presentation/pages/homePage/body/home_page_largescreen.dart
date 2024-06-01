import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navigation_bar_contents.dart';

class HomePageLargeScreen extends StatelessWidget {
  const HomePageLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, navBarHeight),
            child: const NavigationBarContents()),
        body: Stack(
          children: [_content(screenSize, context), DropdownMenuExpertises()],
        ));
  }

  _content(screenSize, context) {
    return Expanded(
      child: Container(
        width: screenSize.width,
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HOME PAGE LARGE SCREEN !!!!!!'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/contact-us');
                },
                child: Text('Go to contact'))
          ],
        ),
      ),
    );
  }
}
