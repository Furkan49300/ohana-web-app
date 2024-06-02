import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String routeName;
  const CustomListTile({super.key, required this.title, this.routeName = ""});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Align(alignment: Alignment.centerRight, child: Text(title)),
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        });
  }
}
