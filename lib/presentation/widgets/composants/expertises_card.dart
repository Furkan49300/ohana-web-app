import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/custom_icon_button.dart';

class ExpertisesCard extends StatefulWidget {
  final String svgLink;
  final String title;
  const ExpertisesCard({super.key, required this.svgLink, this.title = ''});

  @override
  State<ExpertisesCard> createState() => _ExpertisesCardState();
}

class _ExpertisesCardState extends State<ExpertisesCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double paddingValue = _isHovered ? 25 : 20;
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(paddingValue),
        decoration: BoxDecoration(
          color: Colors.purple,
          //borderRadius: BorderRadius.circular(20),
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
            CustomIconButton(
              iconPath: 'assets/services_icons/${widget.svgLink}',
              hoverDisabled: true,
              size: 200,
            ),
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
    );
  }
}
