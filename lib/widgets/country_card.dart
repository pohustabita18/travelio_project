import 'package:flutter/material.dart';
import '../models/country.dart';
import '../screens/country_activities_screen.dart';

class CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onFavoriteToggle; // <--- Functie primita de la parinte

  const CountryCard({
    super.key,
    required this.country,
    required this.onFavoriteToggle, // <--- Obligatorie
  });

  @override
  Widget build(BuildContext context) {
    // Verificare tip imagine
    ImageProvider imageProvider;
    if (country.imageUrl.startsWith('http')) {
      imageProvider = NetworkImage(country.imageUrl);
    } else {
      imageProvider = AssetImage(country.imageUrl);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryActivitiesScreen(country: country),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(
                0.4,
              ), // Mai intunecat ca sa se vada iconita
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          children: [
            // Centru: Textul
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    country.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${country.activities.length} Atracții",
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            // Dreapta Sus: Butonul de Favorite
            Positioned(
              top: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                child: IconButton(
                  icon: Icon(
                    country.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: country.isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed:
                      onFavoriteToggle, // <--- Apelam functia cand dam click
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
