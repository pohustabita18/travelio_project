import 'package:flutter/material.dart';
import '../models/country.dart';
import '../models/travel_activity.dart';
import '../widgets/activity_card.dart';
import 'edit_country_screen.dart';
import 'add_activity_screen.dart';

class CountryActivitiesScreen extends StatefulWidget {
  final Country country;

  const CountryActivitiesScreen({super.key, required this.country});

  @override
  State<CountryActivitiesScreen> createState() =>
      _CountryActivitiesScreenState();
}

class _CountryActivitiesScreenState extends State<CountryActivitiesScreen> {
  late Country currentCountry;

  @override
  void initState() {
    super.initState();
    currentCountry = widget.country;
  }

  void _editCountry() async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCountryScreen(country: currentCountry),
      ),
    );

    if (updatedData != null && updatedData is Country) {
      setState(() {
        currentCountry = updatedData;
      });
    }
  }

  void _addNewActivity() async {
    final newActivity = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddActivityScreen()),
    );

    if (newActivity != null && newActivity is TravelActivity) {
      setState(() {
        currentCountry.activities.add(newActivity);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${newActivity.title} a fost adăugată!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentCountry.name),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.edit), onPressed: _editCountry),
        ],
      ),

      // --- 1. POZITIONAREA BUTONULUI ---
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addNewActivity,
        backgroundColor: Colors.blue[700],
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Atracție", style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            width: double.infinity,
            child: Text(
              currentCountry.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: currentCountry.activities.isEmpty
                ? const Center(child: Text("Nu există atracții. Adaugă una!"))
                : ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                      bottom: 80,
                    ),
                    itemCount: currentCountry.activities.length,
                    itemBuilder: (context, index) {
                      final activity = currentCountry.activities[index];
                      return ActivityCard(activity: activity);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
