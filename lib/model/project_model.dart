class ProjectModel {
  final String name;
  final String description;
  final String image;
  final List<String> technologies;
  final Map<String, String> links;

  ProjectModel({
    required this.name,
    required this.description,
    required this.image,
    required this.technologies,
    required this.links,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      technologies: List<String>.from(json['technologies']),
      links: Map<String, String>.from(json['links']),
    );
  }
}
