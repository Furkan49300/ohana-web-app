import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/custom_icon_button.dart';

class ExpertisesCard extends StatefulWidget {
  final String svgLink;
  final String title;
  final double size;
  const ExpertisesCard(
      {super.key, required this.svgLink, this.title = '', this.size = 200});

  @override
  State<ExpertisesCard> createState() => _ExpertisesCardState();
}

class _ExpertisesCardState extends State<ExpertisesCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double paddingValue = _isHovered ? 25 : 20;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(devServices);
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
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(paddingValue),
          decoration: BoxDecoration(
            color: Colors.purple,
            boxShadow: [
              BoxShadow(
                color: Colors.grey
                    .withOpacity(0.4), // Couleur de l'ombre avec opacité
                spreadRadius: 5, // Rayon de diffusion de l'ombre
                blurRadius: 7, // Rayon de flou de l'ombre
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                'assets/services_icons/${widget.svgLink}',
                width: widget.size,
                height: widget.size,
              ),
              if (widget.title != '')
                const SizedBox(
                  height: 10,
                ),
              if (widget.title != '')
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                )
            ],
          ),
        ),
      ),
    );
  }
}
