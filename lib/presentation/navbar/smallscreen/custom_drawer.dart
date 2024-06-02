import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Header'),
          ),
          ExpansionTile(
            title: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("");
                    },
                    icon: const Icon(Icons.arrow_forward)),
                Text(
                  'Expertises',
                  style: GoogleFonts.majorMonoDisplay(fontSize: 15),
                ),
              ],
            ),
            children: [
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, web);
                },
                title: const Text('WEB'),
              )
            ],
          )
        ],
      ),
    );
  }
}
