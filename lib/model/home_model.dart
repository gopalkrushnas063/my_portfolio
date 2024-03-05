class HomeModel {
  final String image;
  final String name;
  final List<String> position;
  final String careerObjective;
  final String resumeUrl;

  HomeModel({
    required this.image,
    required this.name,
    required this.position,
    required this.careerObjective,
    required this.resumeUrl,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      image: json['image'],
      name: json['name'],
      position: List<String>.from(json['position']),
      careerObjective: json['carrer_objective'],
      resumeUrl: json['resume_url'],
    );
  }
}
