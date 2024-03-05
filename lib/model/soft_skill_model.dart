class SoftSkillModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  SoftSkillModel({required this.id, required this.title, required this.description, required this.imageUrl});

  factory SoftSkillModel.fromJson(Map<String, dynamic> json) {
    return SoftSkillModel(
      id: json['id'],
      title: json['title'],
      description: json['desc'],
      imageUrl: json['images'],
    );
  }
}
