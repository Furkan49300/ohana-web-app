import 'package:flutter/material.dart';

class HomePageLargeScreen extends StatelessWidget {
  const HomePageLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Expanded(
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
      ),
    );
  }
}
