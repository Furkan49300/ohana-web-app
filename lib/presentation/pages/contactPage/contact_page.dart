import 'package:flutter/material.dart';

import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
              Text('CONTACT US'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(root);
                  },
                  child: Text('Go Home'))
            ],
          ),
        ),
      ),
    );
  }
}
