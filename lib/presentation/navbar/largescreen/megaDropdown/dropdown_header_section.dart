import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class DropdownHeaderSection extends StatefulWidget {
  const DropdownHeaderSection(
      {super.key,
      required this.title,
      required this.description,
      required this.sectionWidth,
      required this.paddingValue,
      this.routeName = ''});

  final String title;
  final String description;
  final String routeName;
  final double sectionWidth;
  final double paddingValue;

  @override
  State<DropdownHeaderSection> createState() => _DropdownHeaderSectionState();
}

class _DropdownHeaderSectionState extends State<DropdownHeaderSection> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    var globalColor = _isHovered ? dropDownHoverColor : Colors.white;
    return Container(
      width: widget.sectionWidth,
      padding: EdgeInsets.only(
          left: widget.paddingValue, right: widget.paddingValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: GestureDetector(
              onTap: () {
                context.read<DropdownMenuBloc>().add(HideMenuEvent());
                Navigator.pushNamed(context, widget.routeName);
              },
              child: Text(
                widget.title,
                style: GoogleFonts.majorMonoDisplay(
                    color: globalColor, fontSize: 30),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.description,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
