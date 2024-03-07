class CertificationModel {
  final String name;
  final String image;
  final String link;

  CertificationModel({required this.name, required this.image, required this.link});

  factory CertificationModel.fromJson(Map<String, dynamic> json) {
    return CertificationModel(
      name: json['name'],
      image: json['image'],
      link: json['link'],
    );
  }
}
