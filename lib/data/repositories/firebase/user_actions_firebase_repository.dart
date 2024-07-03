import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ohana_webapp_flutter/logic/entities/user.dart';
import 'package:ohana_webapp_flutter/logic/entities/user_file.dart';
import 'package:ohana_webapp_flutter/logic/repositories/user_actions_repository.dart';

class UserActionsFirebaseRepository implements UserActionsRepository {
  @override

  //UPLOAD FILES
  @override
  Future<void> pushFilesToFirebase(
      User user, List<UserFile?> files, String collection) async {
    try {
      for (int i = 0; i < files.length; i++) {
        if (files[i] != null) {
          Reference storageReference =
              FirebaseStorage.instance.ref().child(files[i]!.path);
          TaskSnapshot uploadFile =
              await storageReference.putData(files[i]!.filesBytes);
          if (files[i]!.use == FileUseType.cv) {
            user.cv = await uploadFile.ref.getDownloadURL();
          } else if (files[i]!.use == FileUseType.coverLetter) {
            user.coverLetterUrl = await uploadFile.ref.getDownloadURL();
          }
        }
      }
      await FirebaseFirestore.instance.collection(collection).add({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'cv': user.cv,
        'cover_letter': user.coverLetterUrl ?? '',
        'date': FieldValue.serverTimestamp(),
      });
      //UPDATE STATES
    } catch (e) {
      throw '(see the corresponding usecase!)';
    }
  }

  //SEND JSON DOCUMENT
  @override
  Future<void> pushJsonDocumentToFirebase(
      String collection, Map<String, dynamic> json) async {
    await FirebaseFirestore.instance.collection(collection).add(json);
  }
}
