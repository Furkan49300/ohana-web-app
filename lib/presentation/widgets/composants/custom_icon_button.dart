import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';

class CustomIconButton extends StatefulWidget {
  final String iconPath;
  final double size;
  final Color hoverColor;
  final Color primaryColor;
  const CustomIconButton(
      {super.key,
      required this.iconPath,
      this.size = 30,
      this.hoverColor = dropDownHoverColor,
      this.primaryColor = Colors.white});

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Color iconColor = _isHovered ? widget.hoverColor : widget.primaryColor;
    return MouseRegion(
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
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          widget.iconPath,
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
