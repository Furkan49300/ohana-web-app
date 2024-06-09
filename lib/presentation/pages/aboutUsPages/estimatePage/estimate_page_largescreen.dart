import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/footer/footer_large_screen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/navigation_bar_contents_largescreen.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/custom_banner.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/text_check_case.dart';

class EstimatePageLargeScreen extends StatelessWidget {
  const EstimatePageLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, navBarHeight),
            child: const NavigationBarContentsLargeScreen()),
        body: Stack(
          children: [
            // CONTENT
            GestureDetector(
              onTap: () {
                context.read<DropdownMenuBloc>().add(HideMenuEvent());
              },
              child: _content(screenSize, context),
            ),
            // NAVBAR MEGA-DROPDOWN MENUS
            const DropdownMenuExpertises(),
            const DropdownMenuOffers(),
            const DropdownMenuAboutUs(),
            //SEARCH BAR
            const SearchNavBar(
              placeholder:
                  "Cherchez une page, un service, un article, une offre d'emploi...",
            )
          ],
        ));
  }

  _content(Size screenSize, context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
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
              const DevisForm(),
              const SizedBox(height: 70),
              FooterLargeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class DevisForm extends StatelessWidget {
  const DevisForm({super.key});

  _getTitle(title) {
    return Text(title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  }

  @override
  Widget build(BuildContext context) {
    //my Local Variable
    double spaceBetween = 30;
    double widthBalance = 1 / 2;
    double screenWidth = MediaQuery.of(context).size.width;
    String selectedOffers = "Service de développement";
    final List<String> options = [
      //different type of services
      'Service de développement',
      'Service site vitrine',
      'Service audit vulnérabilité',
      'Pentesting',
      'Référencement naturel',
      'Autres',
    ];
    //Body
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        _getTitle("Nom"),
        CustomInputField(
          placeholder: 'Nom',
          widthBalance: widthBalance,
        ),
        SizedBox(height: spaceBetween),
        _getTitle('Prénom'),
        const SizedBox(height: 5),
        CustomInputField(
          placeholder: 'Prénom',
          widthBalance: widthBalance,
        ),
        SizedBox(height: spaceBetween),
        _getTitle('Email'),
        const SizedBox(height: 5),
        CustomInputField(
          placeholder: 'exemple@email.com',
          widthBalance: widthBalance,
        ),
        SizedBox(height: spaceBetween),
        const ServicesDropdown(),
        SizedBox(height: spaceBetween),
        Button('Envoyer', type: ButtonType.standard, onTap: () {}),
        const SizedBox(height: 15),
        const TextCheckCase(
          text:
              'Les informations recueillies à partir de ce formulaire sont traitées par OHana pour donner suite à votre demande de contact. Pour connaître et/ou exercer vos droits, référez-vous à la politique de OHana sur la protection des données, cliquez ici.',
        )
      ],
    );
  }
}

class ServicesDropdown extends StatefulWidget {
  const ServicesDropdown({super.key});

  @override
  State<ServicesDropdown> createState() => _ServicesDropdownState();
}

class _ServicesDropdownState extends State<ServicesDropdown> {
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
}
