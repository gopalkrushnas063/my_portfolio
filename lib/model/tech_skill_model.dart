class TechSkillModel {
  final int id;
  final String title;
  final String imageUrl;

  TechSkillModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  factory TechSkillModel.fromJson(Map<String, dynamic> json) {
    return TechSkillModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}
