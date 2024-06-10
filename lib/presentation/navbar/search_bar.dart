import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/router_constants.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';

class SearchNavBar extends StatelessWidget {
  final String placeholder;
  const SearchNavBar(
      {super.key, required this.placeholder, this.textEditingController});
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownMenuBloc, DropdownMenuState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state is SearchNavbarShowedState ? 1 : 0,
          duration: animationStandardDuration,
          child: AnimatedContainer(
            duration: animationStandardDuration,
            height: state is SearchNavbarShowedState ? 70 : 0,
            color: const Color.fromARGB(255, 190, 151, 218),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomInputField(placeholder: placeholder),
              const SizedBox(
                width: 10,
              ),
              Button("RECHERCHER", type: ButtonType.standard, onTap: () {
                Navigator.of(context).pushNamed(search);
              })
            ]),
          ),
        );
      },
    );
  }
}
