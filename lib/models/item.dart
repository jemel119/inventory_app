class Item {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final String category;

  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.category,
  });

  /// Convert Item to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'category': category,
    };
  }

  /// Create an Item from a Firestore document
  factory Item.fromMap(String id, Map<String, dynamic> map) {
    return Item(
      id: id,
      name: map['name'] ?? '',
      quantity: (map['quantity'] ?? 0).toInt(),
      price: (map['price'] ?? 0.0).toDouble(),
      category: map['category'] ?? 'Uncategorized',
    );
  }
}