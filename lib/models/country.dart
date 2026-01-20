import 'travel_activity.dart';

class Country {
  final String name;
  final String imageUrl;
  final String description;
  final List<TravelActivity> activities;
  bool isFavorite;

  Country({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.activities,
    this.isFavorite = false,
  });
}
