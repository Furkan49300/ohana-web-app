import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_state.dart';
import 'package:ohana_webapp_flutter/presentation/constants/animation_constants.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button.dart';

class SearchNavBar extends StatelessWidget {
  final String placeholder;
  const SearchNavBar({super.key, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;

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
              SizedBox(
                width: screenSizeWidth * 2 / 3,
                child: TextField(
                    decoration: InputDecoration(
                        hintText: placeholder,
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: const Color(0xFFF0F2F2),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: purpleNeutral),
                        )),
                    style: const TextStyle(
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Button("RECHERCHER", type: ButtonType.standard, onTap: () {})
            ]),
          ),
        );
      },
    );
  }
}
