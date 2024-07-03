import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/logic/usecases/user_action_usescases.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/regex_controller.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_screen_fit.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/pages/responsive.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/text_check_case.dart';

class EstimatePage extends StatelessWidget {
  const EstimatePage({super.key});

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
                message: "Devis",
                imagePath: 'assets/bg-devis.jpg',
                textColor: purpleNeutral,
              ),
              const SizedBox(height: 50),
              DevisForm(),
              const SizedBox(height: 70),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DevisForm extends StatefulWidget {
  DevisForm({super.key});

  @override
  State<DevisForm> createState() => _DevisFormState();
}

class _DevisFormState extends State<DevisForm> {
  //TEXT CONTROLLER
  final TextEditingController lastNameFieldController = TextEditingController();

  final TextEditingController firstNameFieldController =
      TextEditingController();

  final TextEditingController emailFieldController = TextEditingController();

//TEXT ERROR MESSAGE

  String serviceFieldText = '';

  String emailErrorMessage = '';

  String firstNameErrorMessage = '';

  String lastNameErrorMessage = '';

  String selectedErrorMessage = '';

//GLOBAL KEYS
  final GlobalKey<ServicesDropdownState> serviceDropdownKey =
      GlobalKey<ServicesDropdownState>();

  final GlobalKey<TextCheckCaseState> checkBoxKey =
      GlobalKey<TextCheckCaseState>();

  @override
  Widget build(BuildContext context) {
    //my Local Variable
    double spaceBetween = 30;
    //Body
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        ..._getInputField(
            title: 'Nom',
            errorMessage: firstNameErrorMessage,
            textController: firstNameFieldController),
        SizedBox(height: spaceBetween),
        ..._getInputField(
            title: 'Prénom',
            errorMessage: lastNameErrorMessage,
            textController: lastNameFieldController),
        SizedBox(height: spaceBetween),
        ..._getInputField(
            title: 'Email',
            errorMessage: emailErrorMessage,
            textController: emailFieldController,
            placeholder: 'example@email.com'),
        SizedBox(height: spaceBetween),
        ..._getSevicesDropdown(),
        SizedBox(height: spaceBetween),
        Button('Envoyer', type: ButtonType.standard, onTap: () {
          _sendData();
        }),
        const SizedBox(height: 15),
        TextCheckCase(
          key: checkBoxKey,
          text:
              'Les informations recueillies à partir de ce formulaire sont traitées par OHana pour donner suite à votre demande de contact. Pour connaître et/ou exercer vos droits, référez-vous à la politique de OHana sur la protection des données, cliquez ici.',
        )
      ],
    );
  }

  List<Widget> _getInputField(
      {required String title,
      required String errorMessage,
      required TextEditingController textController,
      String? placeholder}) {
    double widthBalance = 1 / 2;

    return [
      _getTitle(title),
      CustomInputField(
        placeholder: placeholder ?? title,
        widthBalance: widthBalance,
        textEditingController: textController,
      ),
      if (errorMessage != '')
        Text(
          errorMessage,
          style: const TextStyle(
              fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
        ),
    ];
  }

  _getTitle(title) {
    return Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  }

  List<Widget> _getSevicesDropdown() {
    return [
      ServicesDropdown(
        key: serviceDropdownKey,
      ),
      if (selectedErrorMessage != '')
        Text(
          selectedErrorMessage,
          style: const TextStyle(
              fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
        ),
    ];
  }

  _sendData() {
    String firstNameText = firstNameFieldController.text.trim();
    String lastNameText = lastNameFieldController.text.trim();
    String emailText = emailFieldController.text.trim();
    String? seletedService = serviceDropdownKey.currentState!._selectedValue;
    bool isCheckedCase = checkBoxKey.currentState!.isChecked;
    bool validate = textFieldValidate(
        firstName: firstNameText,
        lastNameText: lastNameText,
        email: emailText,
        selectedValue: seletedService);
    if (seletedService != null && validate) {
      if (isCheckedCase) {
        HtmlEscape htmlEscape = const HtmlEscape();
        String lastName = htmlEscape.convert(lastNameText);
        String firstName = htmlEscape.convert(firstNameText);
        String email = htmlEscape.convert(emailText);
        UserActionsUsescases().pushJsonDocumentToFirebase('devis', {
          'lastName': lastName,
          'firstName': firstName,
          'email': email,
          'offer': serviceDropdownKey.currentState!._selectedValue
        });
        _getSnackBar('Envoi Réussi');
      } else {
        _getSnackBar("Veullez cocher la case");
      }
    } else {
      // _getSnackBar('');
    }
  }

  textFieldValidate(
      {required String firstName,
      required String lastNameText,
      required String email,
      String? selectedValue}) {
    bool emailformatValidate = emailRegex.hasMatch(email) && email != '';
    bool firstNameformatValidate =
        nameRegex.hasMatch(firstName) && firstName != "";
    bool lastNameformatValidate =
        nameRegex.hasMatch(lastNameText) && lastNameText != "";

    //first name validate test
    setState(() {
      // first name validate notice
      firstNameErrorMessage = firstNameformatValidate
          ? ""
          : "Veuillez renseigner correctement ce champ";

      // last name validate notice
      lastNameErrorMessage = lastNameformatValidate
          ? ""
          : "Veuillez renseigner correctement ce champ";

      // email validate notice
      emailErrorMessage = emailformatValidate
          ? ""
          : "Veuillez renseigner correctement ce champ";

      // subject validate notice
      selectedErrorMessage =
          selectedValue != null ? "" : "Selectionnez une prestation!!";
    });

    //is validate ?

    return firstNameformatValidate &&
        lastNameformatValidate &&
        emailformatValidate;
  }

  _getSnackBar(String text) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameFieldController.dispose();
    lastNameFieldController.dispose();
    emailFieldController.dispose();
  }
}

class ServicesDropdown extends StatefulWidget {
  const ServicesDropdown({super.key});

  @override
  State<ServicesDropdown> createState() => ServicesDropdownState();
}

class ServicesDropdownState extends State<ServicesDropdown> {
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      //different type of services
      'Service de développement',
      'Service site vitrine',
      'Service audit vulnérabilité',
      'Pentesting',
      'Référencement naturel',
      'Autres',
    ];
    return DropdownButton<String>(
      hint: const Text(
        'Selectionner la prestation',
        style: TextStyle(fontSize: 15),
      ),
      value: _selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
