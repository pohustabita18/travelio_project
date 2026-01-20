import 'package:flutter/material.dart';
import '../models/country.dart';

class EditCountryScreen extends StatefulWidget {
  final Country country;

  const EditCountryScreen({super.key, required this.country});

  @override
  State<EditCountryScreen> createState() => _EditCountryScreenState();
}

class _EditCountryScreenState extends State<EditCountryScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _imageController;

  @override
  /// --- INITIALIZAREA CONTROLLERELOR CU DATELE EXISTENTE ---
  void initState() {
    super.initState();
    // Pre-completam campurile cu datele existente
    _nameController = TextEditingController(text: widget.country.name);
    _descController = TextEditingController(text: widget.country.description);
    _imageController = TextEditingController(text: widget.country.imageUrl);
  }

  void _saveChanges() {
    // Cream o noua tara cu datele modificate, dar pastram lista de atractii veche
    final updatedCountry = Country(
      name: _nameController.text,
      description: _descController.text,
      imageUrl: _imageController.text,
      activities: widget.country.activities,
    );

    // O trimitem inapoi
    Navigator.pop(context, updatedCountry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editează Țara")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Nume Țară"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(labelText: "Descriere"),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: "Link Imagine (sau cale asset)",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveChanges,
              icon: const Icon(Icons.save),
              label: const Text("Salvează Modificările"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
