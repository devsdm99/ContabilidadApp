class Category {
  final int id;
  final String category;

  Category({this.id, this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
    };
  }
}
