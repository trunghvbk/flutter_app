/// The ProductID is an important concept in our domain
/// so it deserves a type of its own
typedef ProductID = String;

class Product {
  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });

  final ProductID id;
  final String imageUrl;
  final String title;
  final double price;
  final int availableQuantity;

  // serialization code
  // TODO: Find the proper way to do this
  factory Product.fromMap(Map<String, dynamic> map, ProductID id) {
    return Product(
        id: map["id"],
        imageUrl: map["image_url"],
        title: map["title"],
        price: map["price"],
        availableQuantity: map["availableQuantity"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
    };
  }
}
