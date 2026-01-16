import 'package:flutter/material.dart';
import '../models/travel_activity.dart';
import '../main.dart';
import 'edit_activity_screen.dart';

class DetailsScreen extends StatefulWidget {
  final TravelActivity activity;

  const DetailsScreen({super.key, required this.activity});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late TravelActivity currentActivity;

  @override
  void initState() {
    super.initState();
    currentActivity = widget.activity;
  }

  // --- LOGICA FAVORITE (NOU) ---
  void _toggleFavorite() {
    setState(() {
      currentActivity.isFavorite = !currentActivity.isFavorite;
    });

    // Mesaj discret
    ScaffoldMessenger.of(context).clearSnackBars(); // Ascundem mesajele vechi
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          currentActivity.isFavorite
              ? 'Adăugat la favorite!'
              : 'Șters de la favorite',
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: currentActivity.isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }

  // Logica de Editare
  void _editActivity() async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditActivityScreen(activity: currentActivity),
      ),
    );

    if (updatedData != null && updatedData is TravelActivity) {
      setState(() {
        currentActivity = updatedData;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Activitatea a fost modificată!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: currentActivity.title,
                child: Image(
                  image: getImageProvider(currentActivity.imageUrl),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, error, stackTrace) {
                    return Container(
                      height: 300,
                      color: Colors.grey,
                      child: const Center(child: Icon(Icons.error)),
                    );
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: _editActivity,
                            ),
                          ),
                          const SizedBox(width: 10),

                          // --- BUTONUL FAVORITE ACTUALIZAT ---
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(
                                currentActivity.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: currentActivity.isFavorite
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              onPressed: _toggleFavorite, // Apelam functia noua
                            ),
                          ),
                          // -----------------------------------
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentActivity.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        currentActivity.location,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Despre activitate",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            currentActivity.description,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 25),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.blue.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Insider Info",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Restaurant: ${currentActivity.suggestedRestaurant}",
                                ),
                                const SizedBox(height: 5),
                                Text("Tip: ${currentActivity.travelTip}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Funcționalitate în lucru!"),
                          ),
                        );
                      },
                      child: Text(
                        "Bilets ${currentActivity.price}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

ImageProvider getImageProvider(String url) {
  if (url.startsWith('http')) {
    return NetworkImage(url);
  } else {
    return AssetImage(url);
  }
}
