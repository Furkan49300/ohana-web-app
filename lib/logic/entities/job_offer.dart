class JobOffer {
  JobOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.profil,
    required this.imagePath,
    required this.place,
    required this.duration,
    required this.contract,
    required this.salary,
    required this.pulishDate,
    required this.alert,
  });
  final String id;
  final String title;
  final String description;
  final String content;
  final List<String> profil;
  final String imagePath;
  final String place;
  final String duration;
  final String contract;
  final String salary;
  final DateTime pulishDate;
  final String alert;
}
