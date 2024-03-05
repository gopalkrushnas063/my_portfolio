class BannerModel {
  final int id;
  final String title;
  final String desc;
  final String image;

  BannerModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      image: json['images'], 
    );
  }
}
