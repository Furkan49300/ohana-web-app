import 'dart:typed_data';

class UserFile {
  Uint8List filesBytes;
  String path;
  FileUseType use;
  UserFile(
      {required this.filesBytes,
      required this.path,
      this.use = FileUseType.standard});
}

enum FileUseType {
  cv(use: 'cv'),

  standard(use: ''),

  coverLetter(use: 'coverLetter'),
  ;

  final String use;
  const FileUseType({
    required this.use,
  });
}
