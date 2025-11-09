class BookModel {
  int id;
  String title;
  double? rating;
  String imageUrl;
  String? description;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    this.rating,
    required this.imageUrl,
  });
}
