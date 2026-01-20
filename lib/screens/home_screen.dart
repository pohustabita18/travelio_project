import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/country.dart';
import '../models/travel_activity.dart'; // Importam modelul activitatii
import '../widgets/country_card.dart';
import '../widgets/activity_card.dart'; // Importam cardul de activitate
import 'add_country_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Country> allCountries = []; // Lista completa
  List<Country> displayedCountries =
      []; // Lista folosita DOAR pentru Tab-ul 0 (Home/Search)
  int _selectedIndex = 0; // 0 = Home, 1 = Favorite

  @override
  void initState() {
    super.initState();
    allCountries = countries;
    displayedCountries = allCountries;
  }

  // --- LOGICA DE CAUTARE (Doar pentru Home) ---
  void _runFilter(String enteredKeyword) {
    List<Country> results = [];
    if (enteredKeyword.isEmpty) {
      results = allCountries;
    } else {
      results = allCountries
          .where(
            (country) => country.name.toLowerCase().contains(
              enteredKeyword.toLowerCase(),
            ),
          )
          .toList();
    }

    setState(() {
      displayedCountries = results;
    });
  }

  // --- LOGICA DE NAVIGARE JOS ---
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Cand revenim pe Home, resetam lista sa arate tot (sau rezultatele cautarii curente)
      if (_selectedIndex == 0) {
        // Aici poti decide daca vrei sa resetezi cautarea sau nu.
        // Momentan o lasam asa cum a ramas.
      } else {
        // Cand intram pe Favorite, fortam o actualizare a UI-ului (setState face asta deja)
      }
    });
  }

  // --- LOGICA TOGGLE FAVORITE TARA ---
  void _toggleCountryFavorite(int index, Country country) {
    setState(() {
      country.isFavorite = !country.isFavorite;
    });
  }

  // --- LOGICA ADAUGARE TARA ---
  void _navigateToAddScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCountryScreen()),
    );

    if (result != null && result is Country) {
      setState(() {
        allCountries.add(result);
        _runFilter("");
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${result.name} a fost adăugată!')),
      );
    }
  }

  // --- CONSTRUCTORUL PENTRU LISTA DE FAVORITE (MIXTA) ---
  Widget _buildFavoritesTab() {
    // 1. Gasim tarile favorite
    final favCountries = allCountries.where((c) => c.isFavorite).toList();

    // 2. Gasim activitatile favorite (cautam in TOATE tarile)
    final favActivities = <TravelActivity>[];
    for (var country in allCountries) {
      // Adaugam activitatile care au isFavorite == true
      favActivities.addAll(country.activities.where((a) => a.isFavorite));
    }

    // 3. Daca nu avem nimic
    if (favCountries.isEmpty && favActivities.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text(
              "Nu ai adăugat nimic la favorite.",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    // 4. Construim lista mixta
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // --- SECTIUNEA TARI FAVORITE ---
        if (favCountries.isNotEmpty) ...[
          const Text(
            "Țări Favorite",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          ...favCountries.map((country) {
            return CountryCard(
              country: country,
              onFavoriteToggle: () {
                setState(() {
                  country.isFavorite = !country.isFavorite;
                });
              },
            );
          }),
          const SizedBox(height: 30), // Spatiu intre sectiuni
        ],

        // --- SECTIUNEA ATRACTII FAVORITE ---
        if (favActivities.isNotEmpty) ...[
          const Text(
            "Atracții Favorite",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          ...favActivities.map((activity) {
            return ActivityCard(activity: activity);
          }),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER (Il aratam doar pe Home, nu si pe Favorite ca sa nu aglomeram) ---
            if (_selectedIndex == 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Travelio\nDescoperă\nLumea cu noi",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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

                      /// Câmpul de căutare
                      child: TextField(
                        onChanged: (value) => _runFilter(value),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: "Caută o țară...",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            else
              // Header simplu pentru pagina de favorite
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Listă Favorite",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

            // --- CONTINUTUL PRINCIPAL ---
            Expanded(
              child: _selectedIndex == 0
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: displayedCountries.length,
                      itemBuilder: (context, index) {
                        return CountryCard(
                          country: displayedCountries[index],
                          onFavoriteToggle: () {
                            // Aici trebuie sa gasim indexul real in lista 'allCountries'
                            // pentru a modifica obiectul original, nu doar cel filtrat
                            setState(() {
                              displayedCountries[index].isFavorite =
                                  !displayedCountries[index].isFavorite;
                            });
                          },
                        );
                      },
                    )
                  : _buildFavoritesTab(), // <--- AICI FOLOSIM NOUA FUNCTIE PENTRU FAVORITE
            ),
          ],
        ),
      ),

      /// Butonul de adăugare
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _navigateToAddScreen,
              backgroundColor: Colors.blue[700],
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Butonul de adăugare
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
