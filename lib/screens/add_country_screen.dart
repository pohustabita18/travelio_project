import 'package:flutter/material.dart';
import '../models/country.dart';

class AddCountryScreen extends StatefulWidget {
  const AddCountryScreen({super.key});

  @override
  State<AddCountryScreen> createState() => _AddCountryScreenState();
}

class _AddCountryScreenState extends State<AddCountryScreen> {
  // Controlere pentru a citi ce scrie utilizatorul
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _imageController = TextEditingController();

  // Cheie pentru validarea formularului
  final _formKey = GlobalKey<FormState>();

  void _saveCountry() {
    if (_formKey.currentState!.validate()) {
      // 1. Cream noua tara
      final newCountry = Country(
        name: _nameController.text,
        description: _descController.text,
        // Daca nu pune link, punem o poza default de pe net
        imageUrl: _imageController.text.isNotEmpty
            ? _imageController.text
            : 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?auto=format&fit=crop&w=800&q=80',
        activities: [], // Lista de atractii porneste goala
      );

      // 2. O trimitem inapoi la Ecranul Principal
      Navigator.pop(context, newCountry);
    }
  }

  @override
  /// --- CONSTRUCTORUL ECRANULUI DE ADAUGARE ȚARĂ ---
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adaugă o Țară Nouă")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Camp Nume
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Numele Țării',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.flag),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Te rog introdu un nume';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Camp Descriere
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Scurtă Descriere',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 15),

              // Camp URL Imagine
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'Link Poză (URL de pe net)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.link),
                  helperText: "Lasă gol pentru o poză generică",
                ),
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 30),

              // Buton Salvare
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _saveCountry,
                  icon: const Icon(Icons.save),
                  label: const Text("Salvează Țara"),
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
