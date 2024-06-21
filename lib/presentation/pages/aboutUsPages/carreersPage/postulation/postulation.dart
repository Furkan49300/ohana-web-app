import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ohana_webapp_flutter/logic/entities/user.dart';
import 'package:ohana_webapp_flutter/logic/entities/user_file.dart';
import 'package:ohana_webapp_flutter/logic/usecases/user_action_usescases.dart';

import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_bloc.dart';
import 'package:ohana_webapp_flutter/presentation/bloc/navbar_dropdown/dropdown_menu_event.dart';
import 'package:ohana_webapp_flutter/presentation/constants/default_values.dart';
import 'package:ohana_webapp_flutter/presentation/constants/dimensions.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_about_us.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_expertises.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/largescreen/megaDropdown/dropdown_menu_offers.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/navbar_responsiveness.dart';
import 'package:ohana_webapp_flutter/presentation/navbar/search_bar.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/text_check_case.dart';

// MAIN BODY

class PostulationPage extends StatefulWidget {
  const PostulationPage({super.key});

  @override
  State<PostulationPage> createState() => _PostulationPageState();
}

class _PostulationPageState extends State<PostulationPage> {
  int currentStep = 1;

  void changeCurrentStepState(int currentstep) {
    setState(() {
      currentStep = currentstep;
    });
  }

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
                  child: _content(screenSize, context),
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

  Widget _content(Size screenSize, BuildContext context) {
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
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Postuler !!",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 30),
              _getProcessStep(step: currentStep),
              const SizedBox(height: 30),
              PostulationForm(
                step: currentStep,
                changeCurrentStep: changeCurrentStepState,
              ),
              if (currentStep == 3) const SizedBox(height: 100)
            ],
          ),
        ),
      ],
    );
  }

  _getProcessStep({required int step}) {
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

//FORM AND DATA

class PostulationForm extends StatefulWidget {
  PostulationForm({
    super.key,
    required this.step,
    required this.changeCurrentStep,
    this.checkBoxState,
  });

//CURRENT STEP/STATES

  int step;

  TextCheckCaseState? checkBoxState;

//CALLBACK

  final Function changeCurrentStep;

//CHILD WIDGET STATE

  @override
  State<PostulationForm> createState() => _PostulationFormState();
}

class _PostulationFormState extends State<PostulationForm> {
//
  bool emailAlert = false;
  double widthBalance = 0.5;
  String downloadMessageError = '';

//INPUT CONTROLLER

  String emailAlertMessage = "Veuillez entrer une adresse valide!";

  TextEditingController firstNameFieldController = TextEditingController();

  TextEditingController lastNameFieldController = TextEditingController();

  TextEditingController emailFieldController = TextEditingController();

//USER AND FILE

  String lastName = '';
  String firstName = '';
  String email = '';
  UserFile? cvFile;
  UserFile? coverLetterFile;
  String? _cvFileName;
  String? _coverLetterFileName;
  IconData _cvDownloadIconFile = Icons.download;
  IconData _coverLetterdownloadIconFile = Icons.download;

// VALIDATE FILES

  bool cvPushed = false;
  String? _uploadStatus;
  bool _isUploading = false;

//GLOBAL KEYS

  GlobalKey<TextCheckCaseState> checkBoxGlobalKey =
      GlobalKey<TextCheckCaseState>();

//PRIMARY WIDGET

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.step == 1) ..._getFirstStepDataView(),
        if (widget.step == 2) ..._getSecondStepDataView(),
        if (widget.step == 3) ..._getThirdStepDataView(screenWidth),
        const SizedBox(height: 15),
        TextCheckCase(
          key: checkBoxGlobalKey,
          color: Colors.white,
          text:
              'Les informations recueillies à partir de ce formulaire sont traitées par Digitemis pour donner suite à votre demande de contact. Pour connaître et/ou exercer vos droits, référez-vous à la politique de OHana sur la protection des données, cliquez ici.',
        ),
      ],
    );
  }

//SECONDARY WIDGET

  List<Widget> _getFirstStepDataView() {
    double spaceBetween = 30;
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
        ],
      ),
      const SizedBox(height: 15),
      Button('Suivant', type: ButtonType.standard, onTap: () {
        getFirstInit();
      }),
    ];
  }

  List<Widget> _getSecondStepDataView() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _getSingleDownloadBlock(placeholder: "monCvExample.pdf", type: 'cv'),
          const SizedBox(width: 10),
          _getSingleDownloadBlock(
              placeholder: "maLettreExample.pdf", type: 'coverLetter'),
        ],
      ),
      const SizedBox(height: 20),
      if (downloadMessageError != '')
        Text(
          downloadMessageError,
          style: const TextStyle(
              fontSize: 34, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      const SizedBox(height: 20),
      Button('Suivant', type: ButtonType.standard, onTap: () {
        getSecondInit();
      }),
    ];
  }

  List<Widget> _getThirdStepDataView(screenWidth) {
    return [
      Container(
        width: 700,
        color: Colors.white,
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
              child: Text(
                'Verifier vos informations',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            //FIRST NAME FIELD

            _getTitle('Votre nom : ', color: Colors.black),
            const SizedBox(height: 20),
            Text(firstName,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                softWrap: true),
            const SizedBox(height: 30),

            //LAST NAME FIELD

            _getTitle('Votre Prénom : ', color: Colors.black),
            const SizedBox(height: 20),
            Text(lastName,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true),
            const SizedBox(height: 30),

            //EMAIL FIELD

            _getTitle('Votre Email : ', color: Colors.black),
            const SizedBox(height: 20),
            Text(email,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true),
            const SizedBox(height: 30),

            //FILE/DOC FIELD

            _getTitle('Vos Documents : ', color: Colors.black),
            const SizedBox(height: 30),
            DottedBorder(
                color: Colors.purple, //color of border
                strokeWidth: 2, // thickness off border
                dashPattern: const [6, 3], // width and space of dashes
                borderType: BorderType.Rect, // border Type
                radius: const Radius.circular(12),
                child: Container(
                  color: const Color(0xFFF4F7F9),
                  padding: const EdgeInsets.all(10),
                  width: screenWidth * widthBalance,
                  child: Text(_cvFileName ?? "", softWrap: true),
                )),
            const SizedBox(height: 20),
            DottedBorder(
                color: Colors.purple, //color of border
                strokeWidth: 2, // thickness off border
                dashPattern: const [6, 3], // width and space of dashes
                borderType: BorderType.Rect, // border Type
                radius: const Radius.circular(12),
                child: Container(
                  color: const Color(0xFFF4F7F9),
                  padding: const EdgeInsets.all(10),
                  width: screenWidth * widthBalance,
                  child: Text(_coverLetterFileName ?? "Selectionnez ?",
                      softWrap: true),
                )),
          ],
        ),
      ),
      const SizedBox(height: 30),
      Button('Confirmer', type: ButtonType.standard, onTap: () {
        _sendData(false);
      }),
    ];
  }

//ASSOCIATED TO ALL SECONDARY WIDGET

  Text _getTitle(title, {Color color = Colors.white}) {
    return Text(title,
        style:
            TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color));
  }

//ASSOCIATED TO SPECIFIC SECONDARY WIDGET

//FIRST STEP

  getFirstInit() {
    String firstNameTextController = firstNameFieldController.text.trim();
    String lastNameTextController = lastNameFieldController.text.trim();
    String emailTextController = emailFieldController.text.trim();

    //control Data

    if (emailRegex.hasMatch(emailTextController)) {
      firstName = firstNameTextController;
      lastName = lastNameTextController;
      email = emailTextController;
      widget.changeCurrentStep(2);
    } else {
      setState(() {
        emailAlert = true;
      });
    }
  }

//SECOND STEP

  getSecondInit() {
    if (cvPushed) {
      widget.changeCurrentStep(3);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Votre cv est obligatoire')));
    }
  }

  SizedBox _getSingleDownloadBlock({
    required String placeholder,
    required String type,
  }) {
    return SizedBox(
      child: GestureDetector(
        onTap: () async {
          try {
            FilePickerResult? result;
            result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['pdf'],
            );
            String filePath =
                'candidates/user_${DateTime.now().millisecondsSinceEpoch}.pdf';

            if (result != null) {
              setState(() {
                if (type == 'cv' && result!.files.isNotEmpty) {
                  _cvFileName = result.files.first.name;
                  cvPushed = true;
                  _cvDownloadIconFile = Icons.download_done;
                  cvFile = UserFile(
                      filesBytes: result.files.single.bytes!,
                      path: filePath,
                      use: FileUseType.cv);
                } else if (type == 'coverLetter' && result!.files.isNotEmpty) {
                  _coverLetterFileName = result.files.first.name;
                  _coverLetterdownloadIconFile = Icons.download_done;
                  coverLetterFile = UserFile(
                      filesBytes: result.files.single.bytes!,
                      path: filePath,
                      use: FileUseType.coverLetter);
                }
              });
            } else {
              setState(() {
                downloadMessageError = 'Aucun fichier sélectionné';
              });
            }
          } catch (error) {
            print(error);
            setState(() {
              downloadMessageError = 'Erreur lors de la sélection du fichier';
            });
          }
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: DottedBorder(
            color: Colors.purple,
            strokeWidth: 2,
            dashPattern: const [6, 3],
            borderType: BorderType.Rect,
            radius: const Radius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(30),
              width: 220,
              height: 200,
              alignment: Alignment.center,
              color: const Color(0xFFF4F7F9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    type == 'cv'
                        ? _cvDownloadIconFile
                        : _coverLetterdownloadIconFile,
                    size: 30,
                  ),
                  Expanded(
                    child: Text(
                      type == 'cv'
                          ? _cvFileName ?? placeholder
                          : _coverLetterFileName ?? placeholder,
                      style: const TextStyle(fontSize: 19, color: Colors.black),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//THIRD/FINAL STEP

  _sendData(bool ischecked) {
    TextCheckCaseState? checkBox = checkBoxGlobalKey.currentState;
    if (checkBox!.isChecked) {
      User user = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      UserActionsUsescases()
          .pushFilesToFirebase(user: user, files: [cvFile, coverLetterFile]);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Envoi réussi')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cochez la  case de vailidation')));
    }
  }
}
