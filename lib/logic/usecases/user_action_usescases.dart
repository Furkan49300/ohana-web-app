import 'package:ohana_webapp_flutter/data/repositories/firebase/user_actions_firebase_repository.dart';
import 'package:ohana_webapp_flutter/logic/entities/user.dart';
import 'package:ohana_webapp_flutter/logic/entities/user_file.dart';
import 'package:ohana_webapp_flutter/logic/repositories/user_actions_repository.dart';

class UserActionsUsescases {
  UserActionsRepository userActionsRepository;

  UserActionsUsescases({UserActionsRepository? userActionsRepository})
      : userActionsRepository =
            userActionsRepository ?? UserActionsFirebaseRepository();

  Future<void> pushJsonDocumentToFirebase(
      String collection, Map<String, dynamic> json) async {
    return userActionsRepository.pushJsonDocumentToFirebase(collection, json);
  }

  Future<void> pushFilesToFirebase({
    required User user,
    required List<UserFile?> files,
  }) async {
    return userActionsRepository.pushFilesToFirebase(user, files);
  }
}
