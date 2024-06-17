import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/logo.dart';

class NavigationBarContentsLargeScreen extends StatelessWidget {
  const NavigationBarContentsLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [const Logo(), _navBarItems(context)],
      ),
    );
  }

  Row _navBarItems(BuildContext context) {
    return Row(
      children: [
        Button(
          "EXPERTISES",
          type: ButtonType.navbar,
          onTap: () {
            if (context.read<DropdownMenuBloc>().state
                is ExpertisesMenuShowedState) {
              context.read<DropdownMenuBloc>().add(HideMenuEvent());
            } else {
              context.read<DropdownMenuBloc>().add(ShowExpertisesMenuEvent());
            }
          },
        ),
        const SizedBox(width: 2),
        Button(
          "OFFRES",
          type: ButtonType.navbar,
          onTap: () {
            if (context.read<DropdownMenuBloc>().state
                is OffersMenuShowedState) {
              context.read<DropdownMenuBloc>().add(HideMenuEvent());
            } else {
              context.read<DropdownMenuBloc>().add(ShowOffersMenuEvent());
            }
          },
        ),
        const SizedBox(width: 2),
        Button(
          "NOUS CONNAITRE",
          type: ButtonType.navbar,
          onTap: () {
            if (context.read<DropdownMenuBloc>().state
                is AboutUsMenuShowedState) {
              context.read<DropdownMenuBloc>().add(HideMenuEvent());
            } else {
              context.read<DropdownMenuBloc>().add(ShowAboutUsMenuEvent());
            }
          },
        ),
        const SizedBox(width: 2),
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
                size: 30);
          },
        )),
        const SizedBox(width: 8),
        Button(
          "CONTACT",
          type: ButtonType.standard,
          onTap: () {
            Navigator.of(context).pushNamed(contactUs);
          },
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
