class User {
  String firstName;
  String lastName;
  String email;
  String? cv;
  String? coverLetterUrl;
  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      this.cv,
      this.coverLetterUrl});
}
