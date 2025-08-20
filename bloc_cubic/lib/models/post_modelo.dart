class PostModel {
  final String title;
  final String body;

  PostModel({required this.title, required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'] ?? "sin título",
      body: json['body'] ?? "",
    );
  }
}
