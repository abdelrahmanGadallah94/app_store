class AllProductsModal {
  final dynamic id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModal? ratingModal;

  AllProductsModal({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModal,
  });

  factory AllProductsModal.fromJson(jsonData) {
    return AllProductsModal(
      id: jsonData["id"],
      title: jsonData["title"],
      price: jsonData["price"],
      description: jsonData["description"],
      category: jsonData["category"],
      image: jsonData["image"],
      ratingModal: jsonData["rating"] == null
          ? null
          : RatingModal.fromJson(jsonData["rating"]),
    );
  }
}

class RatingModal {
  final num rate;
  final num count;

  RatingModal({required this.rate, required this.count});

  factory RatingModal.fromJson(jsonData) {
    return RatingModal(
      rate: jsonData["rate"],
      count: jsonData["count"],
    );
  }
}
