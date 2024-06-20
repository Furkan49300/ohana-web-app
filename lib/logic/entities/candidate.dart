import 'dart:io';

class Candidate {
  final String firstName;
  final String lastName;
  final String email;
  final String jobOffer;
  final File CV;
  final File? coverLetterFile;
  Candidate(
      {required this.CV,
      required this.firstName,
      required this.lastName,
      required this.jobOffer,
      required this.coverLetterFile,
      required this.email});
}
