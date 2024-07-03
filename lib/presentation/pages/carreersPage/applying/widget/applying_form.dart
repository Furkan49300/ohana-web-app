import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:ohana_webapp_flutter/logic/entities/user.dart';
import 'package:ohana_webapp_flutter/logic/entities/user_file.dart';
import 'package:ohana_webapp_flutter/logic/usecases/user_action_usescases.dart';
import 'package:ohana_webapp_flutter/presentation/constants/colors.dart';
import 'package:ohana_webapp_flutter/presentation/constants/regex_controller.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/button_format/button.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/composants/input_field/custom_input_field.dart';
import 'package:ohana_webapp_flutter/presentation/widgets/patterns/text_check_case.dart';

class ApplyingForm extends StatefulWidget {
  ApplyingForm({
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
  State<ApplyingForm> createState() => _ApplyingFormState();
}

class _ApplyingFormState extends State<ApplyingForm> {
//

  bool emailAlert = false;
  double widthBalance = 0.4;

//INPUT CONTROLLER

  String emailAlertMessage = "Veuillez entrer une adresse valide!";

  TextEditingController firstNameFieldController = TextEditingController();

  TextEditingController lastNameFieldController = TextEditingController();

  TextEditingController emailFieldController = TextEditingController();

//ERROR MESSAGE

  String lastNameErrorMessage = '';
  String firstNameErrorMessage = '';
  String emailErrorMessage = '';
  String downloadMessageError = '';

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
  bool _isEditActionOnLastName = false;
  bool _isEditActionOnFirstName = false;
  bool _isEditActionOnEmail = false;

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
      ],
    );
  }

//---------------first Step

  List<Widget> _getFirstStepDataView() {
    double spaceBetween = 30;
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: spaceBetween),
          ..._buildInputTextFIeld(
              title: 'Nom',
              placeholder: '',
              textEditingController: lastNameFieldController,
              inputErrorMessage: lastNameErrorMessage),
          SizedBox(height: spaceBetween),
          ..._buildInputTextFIeld(
              title: 'Prénom',
              placeholder: '',
              textEditingController: firstNameFieldController,
              inputErrorMessage: firstNameErrorMessage),
          SizedBox(height: spaceBetween),
          ..._buildInputTextFIeld(
              title: 'Email',
              placeholder: 'example@email.com',
              textEditingController: emailFieldController,
              inputErrorMessage: emailErrorMessage),
        ],
      ),
      const SizedBox(height: 15),
      Button('Suivant', type: ButtonType.standard, onTap: () {
        getFirstInit();
      }),
    ];
  }

  List<Widget> _buildInputTextFIeld(
      {required String title,
      required String placeholder,
      required TextEditingController textEditingController,
      required String inputErrorMessage}) {
    return [
      _getTitle(title),
      CustomInputField(
        placeholder: placeholder,
        widthBalance: 1 / 2,
        textEditingController: textEditingController,
      ),
      inputErrorMessage != ''
          ? Text(inputErrorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 15))
          : const SizedBox(),
    ];
  }

  getFirstInit() {
    firstName = firstNameFieldController.text.trim();
    lastName = lastNameFieldController.text.trim();
    email = emailFieldController.text.trim();

    //control Data
    bool validateField = textFieldValidate(
        firstName: firstName, lastName: lastName, email: email);
    if (validateField) {
      HtmlEscape htmlEscape = const HtmlEscape();
      lastName = htmlEscape.convert(lastName);
      firstName = htmlEscape.convert(firstName);
      email = htmlEscape.convert(email);
      widget.changeCurrentStep(2);
    }
  }

//-----Second step

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

  SizedBox _getSingleDownloadBlock({
    required String placeholder,
    required String type,
    double? height = 220,
    double? width = 200,
    double paddingAll = 30,
    MainAxisAlignment mainAxisAlignement = MainAxisAlignment.center,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    return SizedBox(
      child: GestureDetector(
        onTap: () async {
          try {
            _downloadFilesFromLocalStorage(type);
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
              padding: EdgeInsets.all(paddingAll),
              width: width,
              height: height,
              alignment: Alignment.center,
              color: const Color(0xFFF4F7F9),
              child: Row(
                textDirection: textDirection,
                mainAxisAlignment: mainAxisAlignement,
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

  getSecondInit() {
    if (cvPushed) {
      widget.changeCurrentStep(3);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Votre cv est obligatoire')));
    }
  }

//----third step

  List<Widget> _getThirdStepDataView(screenWidth) {
    return [
      Container(
        width: 700,
        decoration: const BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
              colors: [purpleLight, purpleNeutral],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.8]),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
                child: Text('Verifier vos informations',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    softWrap: true,
                    textAlign: TextAlign.center)),

            const SizedBox(height: 30),

            ..._buildEditableField(
                title: 'Nom',
                value: lastName,
                inputTextController: lastNameFieldController,
                editState: _isEditActionOnLastName,
                toggleEditState: () {
                  setState(() {
                    _isEditActionOnLastName = !_isEditActionOnLastName;
                  });
                },
                updateValue: (newValue) {
                  setState(() {
                    lastName = newValue;
                  });
                }),

            //LAST NAME FIELD

            ..._buildEditableField(
                title: 'Prénom',
                value: firstName,
                inputTextController: firstNameFieldController,
                editState: _isEditActionOnFirstName,
                toggleEditState: () {
                  setState(() {
                    _isEditActionOnFirstName = !_isEditActionOnFirstName;
                  });
                },
                updateValue: (newValue) {
                  setState(() {
                    firstName = newValue;
                  });
                }),

            //EMAIL FIELD

            ..._buildEditableField(
                title: 'Email',
                value: email,
                type: 'email',
                inputTextController: emailFieldController,
                editState: _isEditActionOnEmail,
                toggleEditState: () {
                  setState(() {
                    _isEditActionOnEmail = !_isEditActionOnEmail;
                  });
                },
                updateValue: (newValue) {
                  setState(() {
                    email = newValue;
                  });
                }),

            //FILE/DOC FIELD

            _getSingleDownloadBlock(
                placeholder: _cvFileName ?? '',
                type: 'cv',
                textDirection: TextDirection.rtl,
                paddingAll: 5,
                mainAxisAlignement: MainAxisAlignment.spaceEvenly,
                width: null,
                height: null),

            const SizedBox(height: 15),

            _getSingleDownloadBlock(
                placeholder:
                    _coverLetterFileName ?? 'Selectionnez un fichier ?',
                type: 'coverLetter',
                textDirection: TextDirection.rtl,
                paddingAll: 5,
                mainAxisAlignement: MainAxisAlignment.spaceEvenly,
                width: null,
                height: null)
          ],
        ),
      ),
      const SizedBox(height: 30),
      Button('Confirmer', type: ButtonType.standard, onTap: () {
        _sendData(false);
      }),
      const SizedBox(height: 15),
      TextCheckCase(
        key: checkBoxGlobalKey,
        color: Colors.white,
        text:
            'Les informations recueillies à partir de ce formulaire sont traitées par Digitemis pour donner suite à votre demande de contact. Pour connaître et/ou exercer vos droits, référez-vous à la politique de OHana sur la protection des données, cliquez ici.',
      ),
    ];
  }

  List<Widget> _buildEditableField({
    required String title,
    required String value,
    String? type,
    required bool editState,
    required Function toggleEditState,
    required Function updateValue,
    required TextEditingController inputTextController,
  }) {
    Color textColors = Colors.white;
    return [
      _getTitle(title, color: textColors),
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: editState
                ? const Border()
                : Border(bottom: BorderSide(width: 2, color: textColors))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            editState
                ? Expanded(
                    child: CustomInputField(
                      placeholder: value,
                      textEditingController: inputTextController,
                      fillColor: purpleNeutral,
                      textColors: textColors,
                    ),
                  )
                : Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                          color: textColors),
                      softWrap: true,
                    ),
                  ),
            IconButton(
              icon:
                  editState ? const Icon(Icons.close) : const Icon(Icons.edit),
              iconSize: 20,
              color: textColors,
              onPressed: () {
                String input = inputTextController.text.trim();
                if (!editState) {
                  toggleEditState();
                } else {
                  if (type == 'email') {
                    emailRegex.hasMatch(input) && input.isNotEmpty
                        ? updateValue(input)
                        : ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Vérifier votre adrèsse')));
                  } else {
                    nameRegex.hasMatch(input) && input.isNotEmpty
                        ? updateValue(input)
                        : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Votre nom ou prénom ne respect pas un format valide')));
                  }
                  toggleEditState();
                }
              },
            ),
          ],
        ),
      ),
      const SizedBox(height: 30),
    ];
  }

//---tools----

  Text _getTitle(title, {Color color = Colors.white}) {
    return Text(title,
        style:
            TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color));
  }

  Future<void> _downloadFilesFromLocalStorage(type) async {
    FilePickerResult? result;
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    String filePath =
        'candidature/user_${DateTime.now().millisecondsSinceEpoch}.pdf';

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
  }

  _sendData(bool ischecked) {
    TextCheckCaseState? checkBox = checkBoxGlobalKey.currentState;
    if (checkBox!.isChecked) {
      User user = User(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      UserActionsUsescases().pushFilesToFirebase(
          user: user,
          files: [cvFile, coverLetterFile],
          collection: 'candidature');
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Envoi réussi')));
      Navigator.pushNamed(context, '/carreers');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cochez la  case de vailidation')));
    }
  }

  bool textFieldValidate({
    required String firstName,
    required String lastName,
    required String email,
  }) {
    // email test
    bool emailformatValidate = emailRegex.hasMatch(email) && email.isNotEmpty;

    // firstName test
    bool firstNameformatValidate =
        nameRegex.hasMatch(firstName) && firstName.isNotEmpty;

    // lastName test
    bool lastNameformatValidate =
        nameRegex.hasMatch(lastName) && lastName.isNotEmpty;

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
    });

    // is validate ?
    return firstNameformatValidate &&
        lastNameformatValidate &&
        emailformatValidate;
  }
}
