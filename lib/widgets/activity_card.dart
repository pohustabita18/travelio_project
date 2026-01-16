import 'package:flutter/material.dart';
import '../models/travel_activity.dart';
import '../screens/details_screen.dart';

class ActivityCard extends StatelessWidget {
  final TravelActivity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    // --- PARTEA "DEȘTEAPTĂ" (LOGICA DUALĂ) ---
    // Aici verificam ce fel de imagine este
    ImageProvider imageProvider;

    if (activity.imageUrl.startsWith('http')) {
      // Daca link-ul incepe cu http, e de pe internet
      imageProvider = NetworkImage(activity.imageUrl);
    } else {
      // Altfel, e o poza locala din assets
      imageProvider = AssetImage(activity.imageUrl);
    }
    // ------------------------------------------

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(activity: activity),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imaginea
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: Hero(
                tag: activity.title,
                // Aici folosim widget-ul generic Image care accepta provider-ul calculat sus
                child: Image(
                  image: imageProvider, // <--- FOLOSIM PROVIDER-UL MIXT
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Daca gresesti link-ul, aratam o eroare frumoasa in loc sa crape aplicatia
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 40,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Imagine indisponibilă",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // Detaliile (Text, Pret, Rating)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    activity.location,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            "${activity.rating} (${activity.reviews})",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "From ${activity.price} lei",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
