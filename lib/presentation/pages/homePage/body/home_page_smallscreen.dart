import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/routers/router_constants.dart';

class HomePageSmallScreen extends StatelessWidget {
  const HomePageSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Expanded(
        child: Container(
          width: screenSize.width,
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HOME PAGE SMALL SCREEN !!!!!!'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(contactUs);
                  },
                  child: Text('Go to contact'))
            ],
          ),
        ),
      ),
    );
  }
}
