class AboutModel {
  final String position;
  final String name;
  final String about;
  final String dob;
  final String webUrl;
  final String degree;
  final String address;
  final String age;
  final String email;
  final String phone;
  final String github;
  final List<Map<String, dynamic>> percentageTechStack;
  final List<Map<String, dynamic>> education;
  final List<Map<String, dynamic>> experience;

  AboutModel({
    required this.position,
    required this.name,
    required this.about,
    required this.dob,
    required this.webUrl,
    required this.degree,
    required this.address,
    required this.age,
    required this.email,
    required this.phone,
    required this.github,
    required this.percentageTechStack,
    required this.education,
    required this.experience,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      position: json['position'],
      name: json['name'],
      about: json['about'],
      dob: json['dob'],
      webUrl: json['web_url'],
      degree: json['degree'],
      address: json['address'],
      age: json['age'],
      email: json['email'],
      phone: json['phone'],
      github: json['github'],
      percentageTechStack: List<Map<String, dynamic>>.from(json['percentage_tech_stack']),
      education: List<Map<String, dynamic>>.from(json['education']),
      experience: List<Map<String, dynamic>>.from(json['experience']),
    );
  }
}
