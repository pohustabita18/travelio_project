import 'package:flutter/material.dart';
import '../models/travel_activity.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllere pentru text
  final _titleController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();
  final _imageController = TextEditingController();
  final _restaurantController = TextEditingController();
  final _tipController = TextEditingController();

  void _saveActivity() {
    if (_formKey.currentState!.validate()) {
      // Cream obiectul cu datele introduse
      final newActivity = TravelActivity(
        title: _titleController.text,
        location: _locationController.text,
        price: int.tryParse(_priceController.text) ?? 0,
        description: _descController.text,
        // Daca nu pune link, punem o poza default
        imageUrl: _imageController.text.isNotEmpty
            ? _imageController.text
            : 'https://images.unsplash.com/photo-1526772662000-3f88f107f5d8?auto=format&fit=crop&w=800&q=80',
        suggestedRestaurant: _restaurantController.text.isNotEmpty
            ? _restaurantController.text
            : "La alegere",
        travelTip: _tipController.text.isNotEmpty
            ? _tipController.text
            : "Distracție plăcută!",
        // Valori default pentru rating (fiind noua)
        rating: 5.0,
        reviews: 0,
      );

      // Il trimitem inapoi
      Navigator.pop(context, newActivity);
    }
  }

  @override
  /// --- CONSTRUCTORUL ECRANULUI DE ADAUGARE ACTIVITĂȚII ---
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adaugă Atracție Nouă")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Titlu Activitate",
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val!.isEmpty ? "Introdu un titlu" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: "Locație (ex: Roma, Italia)",
                  border: OutlineInputBorder(),
                ),
                validator: (val) => val!.isEmpty ? "Introdu o locație" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: "Preț (lei)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (val) => val!.isEmpty ? "Introdu un preț" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: "Descriere",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: "Link Imagine (URL)",
                  border: OutlineInputBorder(),
                  helperText: "Lasă gol pentru imagine generică",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _restaurantController,
                decoration: const InputDecoration(
                  labelText: "Restaurant Recomandat",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _tipController,
                decoration: const InputDecoration(
                  labelText: "Sfat de călătorie",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _saveActivity,
                  icon: const Icon(Icons.add_location_alt),
                  label: const Text("Adaugă în Listă"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
