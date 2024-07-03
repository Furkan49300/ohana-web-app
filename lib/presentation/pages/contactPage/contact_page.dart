import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ohana_webapp_flutter/logic/usecases/user_action_usescases.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/regex_controller.dart';
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

class ContactForm extends StatefulWidget {
  ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  // CONTROLLER
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController subjectFieldController = TextEditingController();
  TextEditingController messageFieldController = TextEditingController();

  GlobalKey<TextCheckCaseState> checkBoxGlobalKey =
      GlobalKey<TextCheckCaseState>();

  // ERROR MESSAGE
  String lastNameErrorMessage = '';
  String firstNameErrorMessage = '';
  String emailErrorMessage = '';
  String subjectErrorMessage = '';
  String contentErrorMessage = '';

  // MAIN CONTENT
  @override
  Widget build(BuildContext context) {
    double spaceBetween = 30;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._getInputField(
            title: 'Nom',
            errorMessage: lastNameErrorMessage,
            textController: lastNameFieldController),
        SizedBox(height: spaceBetween),
        ..._getInputField(
            title: 'Prénom',
            errorMessage: firstNameErrorMessage,
            textController: firstNameFieldController),
        SizedBox(height: spaceBetween),
        ..._getInputField(
            title: 'Email',
            errorMessage: emailErrorMessage,
            textController: emailFieldController),
        SizedBox(height: spaceBetween),
        ..._getInputField(
            title: 'Sujet',
            errorMessage: subjectErrorMessage,
            textController: subjectFieldController),
        SizedBox(height: spaceBetween),
        const SizedBox(height: 5),
        ..._getTextarea(errorMessage: contentErrorMessage),
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

  _getTitle(title) {
    return Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  }

  List<Widget> _getInputField(
      {String? title,
      required String errorMessage,
      required TextEditingController textController,
      String? placeholder,
      double widthBalance = 1 / 2}) {
    return [
      _getTitle(title ?? ""),
      CustomInputField(
        placeholder: placeholder ?? title ?? '',
        widthBalance: widthBalance,
        textEditingController: textController,
      ),
      if (errorMessage.isNotEmpty)
        Text(
          errorMessage,
          style: const TextStyle(
              fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
        ),
    ];
  }

  List<Widget> _getTextarea({required String errorMessage}) {
    return [
      CustomTextarea(
        placeholder: "Message ...",
        textEditingController: messageFieldController,
      ),
      if (errorMessage.isNotEmpty)
        Text(
          errorMessage,
          style: const TextStyle(
              fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
        ),
    ];
  }

  _sendData(GlobalKey<TextCheckCaseState> checkBoxGlobalKey) {
    String firstName = firstNameFieldController.text.trim();
    String lastName = lastNameFieldController.text.trim();
    String email = emailFieldController.text.trim();
    String subject = subjectFieldController.text.trim();
    String message = messageFieldController.text.trim();
    bool isCheckedCase = checkBoxGlobalKey.currentState!.isChecked;
    bool validate = textFieldValidate(
        firstName: firstName,
        lastNameText: lastName,
        email: email,
        subject: subject,
        content: message);
    if (validate) {
      if (isCheckedCase) {
        HtmlEscape htmlEscape = const HtmlEscape();
        lastName = htmlEscape.convert(lastName);
        firstName = htmlEscape.convert(firstName);
        email = htmlEscape.convert(email);
        subject = htmlEscape.convert(subject);
        message = htmlEscape.convert(message);
        UserActionsUsescases().pushJsonDocumentToFirebase('messagerie', {
          'lastName': lastName,
          'firstName': firstName,
          'email': email,
          'subject': subject,
          'content': message,
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Envoi réussi')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Cochez la case')));
      }
    }
  }

  bool textFieldValidate(
      {required String firstName,
      required String lastNameText,
      required String email,
      required String subject,
      required String content}) {
    // email test
    bool emailformatValidate = emailRegex.hasMatch(email) && email.isNotEmpty;

    // firstName test
    bool firstNameformatValidate =
        nameRegex.hasMatch(firstName) && firstName.isNotEmpty;

    // lastName test
    bool lastNameformatValidate =
        nameRegex.hasMatch(lastNameText) && lastNameText.isNotEmpty;

    // subject test
    bool subjectformatValidate =
        nameRegex.hasMatch(subject) && subject.isNotEmpty;

    // content test
    bool contentformatValidate = content.isNotEmpty;

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
      subjectErrorMessage = subjectformatValidate
          ? ""
          : "Veuillez renseigner correctement ce champ";

      // content validate notice
      contentErrorMessage = contentformatValidate
          ? ""
          : "Veuillez renseigner correctement ce champ";
    });

    // is validate ?
    return firstNameformatValidate &&
        lastNameformatValidate &&
        emailformatValidate &&
        subjectformatValidate &&
        contentformatValidate;
  }

//dispose
  @override
  void dispose() {
    super.dispose();
    lastNameFieldController.dispose();
    firstNameFieldController.dispose();
    emailFieldController.dispose();
    subjectFieldController.dispose();
    messageFieldController.dispose();
  }
}
