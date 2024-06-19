import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/drawerSection/about_us_drawer_section.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/drawerSection/expertises_drawer_section.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/smallscreen/drawerSection/offers_drawer_section.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: purpleNeutral),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'OHana Entreprise',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ExpertisesDrawerSection(),
          OffersDrawerSection(),
          AboutUsDrawerSection()
        ],
      ),
    );
  }
}
