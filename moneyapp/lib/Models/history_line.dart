class HistoryLine {
  final int id;
  final String name;
  final double price;
  final DateTime time;
  final int categoryId;

  HistoryLine({this.id, this.name, this.price, this.time, this.categoryId});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'time': time,
      'categoryId': categoryId
    };
  }
}
