class TravelActivity {
  final String title;
  final String imageUrl;
  final String location;
  final double rating;
  final int reviews;
  final int price;
  final String description;
  final String suggestedRestaurant;
  final String travelTip;

  // CAMP NOU
  bool isFavorite;

  TravelActivity({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.description,
    required this.suggestedRestaurant,
    required this.travelTip,
    this.isFavorite = false, // Implicit nu este favorita
  });
}
