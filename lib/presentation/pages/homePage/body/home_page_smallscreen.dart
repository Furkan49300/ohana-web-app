import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/custom_drawer.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/navigation_bar_contents_smallscreen.dart';

class HomePageSmallScreen extends StatelessWidget {
  const HomePageSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: const CustomEndDrawer(),
      appBar: PreferredSize(
        preferredSize: Size(screenSizeWidth, navBarHeight),
        child: AppBar(
          automaticallyImplyLeading: false, // This removes the back button
          actions: [Container()],
          flexibleSpace: const NavigationBarContentsSmallScreen(),
        ),
      ),
      body: Expanded(
        child: Container(
          width: screenSizeWidth,
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('HOME PAGE SMALL SCREEN !!!!!!'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(contactUs);
                  },
                  child: const Text('Go to contact'))
            ],
          ),
        ),
      ),
    );
  }
}
