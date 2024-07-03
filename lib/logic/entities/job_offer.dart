class JobOffer {
  JobOffer({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.place,
    required this.duration,
    required this.contract,
    this.salary,
    required this.pulishDate,
    required this.alert,
  });
  final String id;
  final String title;
  final String imagePath;
  final String place;
  final String duration;
  final String contract;
  final int? salary;
  final DateTime pulishDate;
  final String? alert;
}
