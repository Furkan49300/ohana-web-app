import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/logo.dart';

class NavigationBarContentsSmallScreen extends StatelessWidget {
  const NavigationBarContentsSmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        BlocBuilder<DropdownMenuBloc, DropdownMenuState>(
          builder: (context, state) {
            return Expanded(
              child: AnimatedOpacity(
                opacity: state is SearchNavbarShowedState ? 1 : 0,
                duration: animationStandardDuration,
                child: AnimatedContainer(
                  duration: animationStandardDuration,
                  transform: Matrix4.translationValues(
                      state is SearchNavbarShowedState
                          ? 0
                          : screenSizeWidth / 2,
                      0,
                      0),
                  child: const CustomInputField(
                      placeholder:
                          "Cherchez une page, un service, un article, une offre d'emploi..."),
                ),
              ),
            );
          },
        ),
        Row(
          children: [
            IconButton(onPressed: () {
              if (context.read<DropdownMenuBloc>().state
                  is SearchNavbarShowedState) {
                context.read<DropdownMenuBloc>().add(HideMenuEvent());
              } else {
                context.read<DropdownMenuBloc>().add(ShowSearchNavbarEvent());
              }
            }, icon: BlocBuilder<DropdownMenuBloc, DropdownMenuState>(
              builder: (context, state) {
                return Icon(
                  context.read<DropdownMenuBloc>().state
                          is SearchNavbarShowedState
                      ? Icons.close
                      : Icons.search,
                );
              },
            )),
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                  ));
            }),
            const SizedBox(width: 20)
          ],
        )
      ],
    );
  }
}
