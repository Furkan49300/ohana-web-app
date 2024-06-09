import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class NavbarLink extends StatefulWidget {
  final String text;
  final String routeName;
  const NavbarLink({super.key, required this.text, required this.routeName});

  @override
  State<NavbarLink> createState() => _NavbarLinkState();
}

class _NavbarLinkState extends State<NavbarLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    var globalColor = _isHovered ? dropDownHoverColor : Colors.white;
    return GestureDetector(
      onTap: () {
        context.read<DropdownMenuBloc>().add(HideMenuEvent());
        Navigator.of(context).pushNamed(widget.routeName);
      },
      child: Row(
        children: [
          MouseRegion(
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
            child: Text(
              widget.text,
              style: TextStyle(color: globalColor, fontSize: 17),
            ),
          ),
          AnimatedOpacity(
            opacity: _isHovered ? 1.0 : 0.0,
            duration: animationStandardDuration,
            child: AnimatedContainer(
                duration: animationStandardDuration,
                transform:
                    Matrix4.translationValues(_isHovered ? 0 : -50, 0, 0),
                child: Icon(Icons.keyboard_arrow_right, color: globalColor)),
          )
        ],
      ),
    );
  }
}
