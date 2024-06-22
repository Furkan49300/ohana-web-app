import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/Custom_textarea.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/text_check_case.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = Responsive.getScreenSizeWidth(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: NavbarResponsiveness.getNavbar(screenSizeWidth),
        endDrawer: NavbarResponsiveness.getEndDrawer(screenSizeWidth),
        body: Stack(
          children: [
            // CONTENT
            GestureDetector(
              onTap: () {
                context.read<DropdownMenuBloc>().add(HideMenuEvent());
              },
              child: _content(screenSizeWidth, context),
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
        ));
  }

  _content(double screenSizeWidth, context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: screenSizeWidth,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomBanner(
                message: "Contact",
                imagePath:
                    'assets/homepage_image/programming-background-collage.jpg',
              ),
              const SizedBox(height: 50),
              ContactForm(),
              const SizedBox(height: 70),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  ContactForm({super.key});

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
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) {
    double spaceBetween = 30;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
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
        SizedBox(height: spaceBetween),
        _getTitle('Sujet'),
        const SizedBox(height: 5),
        CustomInputField(
          placeholder: 'Ecrire le sujet du message',
          widthBalance: 1 / 2,
          textEditingController: subjectFieldController,
        ),
        SizedBox(height: spaceBetween),
        const SizedBox(height: 5),
        CustomTextarea(
          placeholder: "Message ...",
          textEditingController: messageFieldController,
        ),
        const SizedBox(height: 10),
        Button('Envoyer', type: ButtonType.standard, onTap: () {
          _sendData(checkBoxGlobalKey);
        }),
        const SizedBox(height: 15),
        TextCheckCase(
          key: checkBoxGlobalKey,
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
    String message = messageFieldController.text;
    TextCheckCaseState? checkBox = checkBoxGlobalKey.currentState;
    if (checkBox != null && checkBox.isChecked) {
      final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (emailRegex.hasMatch(email)) {
        firstName = const HtmlEscape().convert(firstName);
      }
    }
  }
}
