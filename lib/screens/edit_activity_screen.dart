import 'package:flutter/material.dart';
import '../models/travel_activity.dart';

class EditActivityScreen extends StatefulWidget {
  final TravelActivity activity;

  const EditActivityScreen({super.key, required this.activity});

  @override
  State<EditActivityScreen> createState() => _EditActivityScreenState();
}

class _EditActivityScreenState extends State<EditActivityScreen> {
  // Controllere pentru toate campurile
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descController;
  late TextEditingController _restaurantController;
  late TextEditingController _tipController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.activity.title);
    _priceController = TextEditingController(
      text: widget.activity.price.toString(),
    );
    _descController = TextEditingController(text: widget.activity.description);
    _restaurantController = TextEditingController(
      text: widget.activity.suggestedRestaurant,
    );
    _tipController = TextEditingController(text: widget.activity.travelTip);
  }

  void _saveChanges() {
    final updatedActivity = TravelActivity(
      title: _titleController.text,
      price:
          int.tryParse(_priceController.text) ?? 0, // Convertim text in numar
      description: _descController.text,
      suggestedRestaurant: _restaurantController.text,
      travelTip: _tipController.text,
      // Pastram datele vechi pe care nu le editam aici
      imageUrl: widget.activity.imageUrl,
      location: widget.activity.location,
      rating: widget.activity.rating,
      reviews: widget.activity.reviews,
    );

    Navigator.pop(context, updatedActivity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editează Activitatea")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Titlu Activitate"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Preț (lei)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Descriere"),
              maxLines: 4,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _restaurantController,
              decoration: const InputDecoration(
                labelText: "Restaurant Recomandat",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _tipController,
              decoration: const InputDecoration(labelText: "Sfat de Călătorie"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveChanges,
              icon: const Icon(Icons.save),
              label: const Text("Salvează Modificările"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
