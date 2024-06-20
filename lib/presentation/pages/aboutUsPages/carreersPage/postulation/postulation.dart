import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/text_check_case.dart';

class PostulationPage extends StatelessWidget {
  const PostulationPage({super.key});
  final int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavbarResponsiveness.getNavbar(screenSize.width),
      endDrawer: NavbarResponsiveness.getEndDrawer(screenSize.width),
      body: Expanded(
        child: SizedBox(
            width: screenSize.width,
            child: Stack(
              children: [
                // CONTENT
                GestureDetector(
                  onTap: () {
                    context.read<DropdownMenuBloc>().add(HideMenuEvent());
                  },
                  child: SingleChildScrollView(
                    child: _content(screenSize, context),
                  ),
                ),
                // NAVBAR MEGA-DROPDOWN MENUS
                const DropdownMenuExpertises(),
                const DropdownMenuOffers(),
                const DropdownMenuAboutUs(),

                //SEARCH BAR
                SearchNavBar(
                  placeholder:
                      "Cherchez une page, un service, un article, une offre d'emploi...",
                )
              ],
            )),
      ),
    );
  }

  _content(Size screenSize, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.srcATop,
          ),
          child: Image.asset(
            "maxresdefault.jpg",
            height: screenSize.height,
            width: screenSize.width,
            fit: BoxFit.cover,
            //fit the height of container
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Postuler !!",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 30),
            _getProcessStep(1),
            const SizedBox(height: 30),
            PostulationForm(),
          ],
        ),
      ],
    );
  }

  _getProcessStep(int step) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: step >= 1 ? Colors.purple : Colors.white,
              borderRadius: BorderRadius.circular(completeCirvularItem)),
          child: Text("1",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: step >= 1 ? Colors.white : Colors.black)),
        ),
        _getHorizontalDivider(step >= 2 ? Colors.purple : Colors.white),
        Container(
          padding: const EdgeInsets.all(0),
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: step >= 2 ? Colors.purple : Colors.white,
              borderRadius: BorderRadius.circular(completeCirvularItem)),
          child: Text("2",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: step >= 2 ? Colors.white : Colors.black)),
        ),
        _getHorizontalDivider(step >= 3 ? Colors.purple : Colors.white),
        Container(
          padding: const EdgeInsets.all(0),
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: step >= 3 ? Colors.purple : Colors.white,
              borderRadius: BorderRadius.circular(completeCirvularItem)),
          child: Text("3",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: step >= 3 ? Colors.white : Colors.black)),
        )
      ],
    );
  }

  _getHorizontalDivider(Color color) {
    return Container(
      height: 2.0,
      width: 50,
      color: color,
    );
  }
}

class PostulationForm extends StatelessWidget {
  PostulationForm({super.key});

  bool emailAlert = false;
  String emailAlertMessage = "Veuillez entrer une adresse valide!";
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController subjectFieldController = TextEditingController();
  TextEditingController messageFieldController = TextEditingController();
  GlobalKey<TextCheckCaseState> checkBoxGlobalKey =
      GlobalKey<TextCheckCaseState>();

  _getTitle(title) {
    return Text(title,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    double spaceBetween = 30;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle("Nom"),
        CustomInputField(
          placeholder: 'Nom',
          widthBalance: 1 / 2,
          textEditingController: firstNameFieldController,
        ),
        SizedBox(height: spaceBetween),
        _getTitle('Prénom'),
        const SizedBox(height: 5),
        CustomInputField(
          placeholder: 'Prénom',
          widthBalance: 1 / 2,
          textEditingController: lastNameFieldController,
        ),
        SizedBox(height: spaceBetween),
        _getTitle('Email'),
        const SizedBox(height: 5),
        CustomInputField(
          placeholder: 'exemple@email.com',
          widthBalance: 1 / 2,
          textEditingController: emailFieldController,
        ),
        emailAlert
            ? Text(emailAlertMessage,
                style: const TextStyle(color: Colors.red, fontSize: 15))
            : const SizedBox(),
        const SizedBox(height: 10),
        Button('Envoyer', type: ButtonType.standard, onTap: () {
          _sendData(checkBoxGlobalKey);
        }),
        const SizedBox(height: 15),
        TextCheckCase(
          key: checkBoxGlobalKey,
          color: Colors.white,
          text:
              'Les informations recueillies à partir de ce formulaire sont traitées par Digitemis pour donner suite à votre demande de contact. Pour connaître et/ou exercer vos droits, référez-vous à la politique de OHana sur la protection des données, cliquez ici.',
        )
      ],
    );
  }

  _sendData(GlobalKey<TextCheckCaseState> checkBoxGlobalKey) {
    String firstName = firstNameFieldController.text;
    String lastName = lastNameFieldController.text;
    String email = emailFieldController.text;
    String subject = subjectFieldController.text;
    TextCheckCaseState? checkBox = checkBoxGlobalKey.currentState;
    if (checkBox != null && checkBox.isChecked) {
      final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (emailRegex.hasMatch(email)) {
        firstName = const HtmlEscape().convert(firstName);
      }
    }
  }
}
