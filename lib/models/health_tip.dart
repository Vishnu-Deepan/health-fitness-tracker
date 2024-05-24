class HealthTip {
  final String title;
  final String description;
  final String imageUrl;

  HealthTip({required this.title, required this.description, required this.imageUrl});

  factory HealthTip.fromJson(Map<String, dynamic> json) {
    return HealthTip(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
