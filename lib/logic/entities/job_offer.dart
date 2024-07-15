class JobOffer {
  final String id;
  final String title;
  final String imagePath;
  final String place;
  final String textContent;
  final String duration;
  final String contract;
  final int? salary;
  final DateTime pulishDate;
  final String? alert;

  JobOffer(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.place,
      required this.duration,
      required this.contract,
      this.salary,
      required this.pulishDate,
      required this.alert,
      required this.textContent});

  factory JobOffer.fromJson(Map<String, dynamic> json) {
    return JobOffer(
      alert: '',
      id: json['id'] ?? '',
      title: json['title'] ?? 'No title',
      place: json['place'] ?? 'No place',
      contract: json['contract'] ?? 'No contract',
      duration: json['duration'] ?? 'No duration',
      salary: json['salary'],
      imagePath: json['imagePath'] ?? '',
      pulishDate: json['pulishDate'],
      textContent: json['textContent'] ?? '',
    );
  }
}
