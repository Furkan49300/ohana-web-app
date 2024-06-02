import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class DropdownHeaderSection extends StatefulWidget {
  const DropdownHeaderSection({
    super.key,
    required this.title,
    required this.description,
    required this.sectionWidth,
    required this.paddingValue,
  });

  final String title;
  final String description;
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
            child: Text(
              widget.title,
              style: GoogleFonts.majorMonoDisplay(
                  color: globalColor, fontSize: 30),
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
