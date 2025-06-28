class ProductModels {
  int id;
  String image;
  String title;
  String description;
  int price;

  ProductModels({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  // Factory method to create a Welcome instance from JSON
  factory ProductModels.fromJson(Map<String, dynamic> json) {
    return ProductModels(
      id: (json['id'] as num).toInt(),                 // Ensures 'id' is an int
      image: json['image'],                      // Handles null values
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toInt(),           // Ensures 'price' is an int
    );
  }

  // Method to convert a Welcome instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'description': description,
      'price': price,
    };
  }
}
