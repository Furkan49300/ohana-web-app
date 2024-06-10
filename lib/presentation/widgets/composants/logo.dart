import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';

class Logo extends StatelessWidget {
  final double heightLogo;
  final double paddingLeft;
  const Logo({super.key, this.heightLogo = 150, this.paddingLeft = 45});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(root);
        context.read<DropdownMenuBloc>().add(HideMenuEvent());
      },
      child: Padding(
        padding: EdgeInsets.only(left: paddingLeft, top: 5, bottom: 5),
        child: Image.asset(
          'assets/logo.png',
          width: heightLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
