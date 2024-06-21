import 'package:ohana_webapp_flutter/logic/entities/user.dart';
import 'package:ohana_webapp_flutter/logic/entities/user_file.dart';

abstract class UserActionsRepository {
  Future<void> pushJsonDocumentToFirebase(
      String collection, Map<String, dynamic> json);
  Future<void> pushFilesToFirebase(User user, List<UserFile?> files);
}
