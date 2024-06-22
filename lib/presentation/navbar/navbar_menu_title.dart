import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class NavbarMenuTitle extends StatefulWidget {
  final String title;
  final String routeName;
  const NavbarMenuTitle(
      {super.key, required this.title, required this.routeName});

  @override
  State<NavbarMenuTitle> createState() => _NavbarMenuTitleState();
}

class _NavbarMenuTitleState extends State<NavbarMenuTitle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    var globalColor = _isHovered ? dropDownHoverColor : Colors.white;
    return GestureDetector(
      onTap: () {
        context.read<DropdownMenuBloc>().add(HideMenuEvent());
        Navigator.of(context).pushNamed(widget.routeName);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: NavbarMenuTitleContent(
            globalColor: globalColor, title: widget.title),
      ),
    );
  }
}

class NavbarMenuTitleContent extends StatelessWidget {
  const NavbarMenuTitleContent({
    super.key,
    required this.globalColor,
    required this.title,
  });

  final Color globalColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: globalColor, width: 2))),
      child: Text(
        title,
        style: TextStyle(color: globalColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
