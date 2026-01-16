import '../models/country.dart';
import '../models/travel_activity.dart';

final List<Country> countries = [
  // --- ITALIA ---
  Country(
    name: 'Italia',
    imageUrl: 'assets/images/italia_cover.jpg',
    description:
        'Țara artei, a istoriei și a pastelor. Descoperă frumusețea "La Dolce Vita".',
    activities: [
      TravelActivity(
        title: 'Colosseum și Forumul Roman',
        location: 'Roma, Italia',
        imageUrl: 'assets/images/colosseum.jpg',
        rating: 4.8,
        reviews: 32050,
        price: 250,
        description:
            'Pășește pe arena gladiatorilor și explorează inima imperiului roman.',
        suggestedRestaurant: 'Trattoria Luzzi (Paste Carbonara)',
        travelTip:
            'Cumpără biletul online cu 2 zile înainte pentru a evita coada uriașă.',
      ),
      TravelActivity(
        title: 'Gondole în Veneția',
        location: 'Veneția, Italia',
        imageUrl: 'assets/images/venetia.jpg',
        rating: 4.6,
        reviews: 15400,
        price: 180,
        description: 'O plimbare romantică pe canalele înguste ale Veneției.',
        suggestedRestaurant: 'Osteria Al Squero (Cicchetti)',
        travelTip:
            'Cel mai bun moment pentru poze este la apus, lângă Podul Rialto.',
      ),
      TravelActivity(
        title: 'Catedrala Santa Maria del Fiore',
        location: 'Florența, Italia',
        imageUrl: 'assets/images/duomo_florenta.jpg',
        rating: 4.9,
        reviews: 21000,
        price: 100,
        description:
            'Urcă în domul lui Brunelleschi pentru o priveliște panoramică asupra Florenței.',
        suggestedRestaurant: 'All\'Antico Vinaio (Sandvișuri)',
        travelTip: 'Trebuie să urci 463 de trepte, ia apă cu tine!',
      ),
      TravelActivity(
        title: 'Ruinele de la Pompeii',
        location: 'Napoli, Italia',
        imageUrl: 'assets/images/pompeii.jpg',
        rating: 4.7,
        reviews: 18500,
        price: 120,
        description:
            'Orașul roman antic îngropat de erupția vulcanului Vezuviu.',
        suggestedRestaurant: 'Pizzeria da Michele (Pizza Margherita)',
        travelTip:
            'Ia încălțăminte comodă, drumurile sunt din piatră cubică veche.',
      ),
      TravelActivity(
        title: 'Cinque Terre: Tur cu barca',
        location: 'Liguria, Italia',
        imageUrl: 'assets/images/cinque_terre.jpg',
        rating: 4.8,
        reviews: 9800,
        price: 350,
        description:
            'Descoperă cele 5 sate colorate cocoțate pe stâncile abrupte ale Rivierei Italiene.',
        suggestedRestaurant: 'Nessun Dorma (Bruschete)',
        travelTip:
            'Vizitează satul Manarola pentru cea mai celebră priveliște.',
      ),
    ],
  ),

  // --- TURCIA ---
  Country(
    name: 'Turcia',
    imageUrl: 'assets/images/turcia_cover.jpg',
    description:
        'Unde orientul întâlnește occidentul, o țară plină de mistere.',
    activities: [
      TravelActivity(
        title: 'Zbor cu balonul în Cappadocia',
        location: 'Cappadocia, Turcia',
        imageUrl: 'assets/images/cappadocia.jpg',
        rating: 4.9,
        reviews: 12000,
        price: 850,
        description:
            'O experiență magică la răsărit, plutind deasupra formațiunilor stâncoase.',
        suggestedRestaurant: 'Topdeck Cave Restaurant',
        travelTip:
            'Zborurile se anulează dacă e vânt, rezervă pentru prima dimineață a sejurului.',
      ),
      TravelActivity(
        title: 'Hagia Sophia',
        location: 'Istanbul, Turcia',
        imageUrl: 'assets/images/istanbul.jpg',
        rating: 4.7,
        reviews: 45000,
        price: 0,
        description:
            'O capodoperă arhitecturală cu o istorie de peste 1500 de ani.',
        suggestedRestaurant: 'Hafiz Mustafa 1864 (Baklava)',
        travelTip:
            'Vizitează moscheea dimineața devreme, înainte de ora 09:00.',
      ),
      TravelActivity(
        title: 'Terasele de la Pamukkale',
        location: 'Denizli, Turcia',
        imageUrl: 'assets/images/pamukkale.jpg',
        rating: 4.5,
        reviews: 8700,
        price: 150,
        description:
            'Băile termale naturale de un alb imaculat, cunoscute ca "Castelul de Bumbac".',
        suggestedRestaurant: 'White House Restaurant',
        travelTip:
            'Vei merge desculț pe travertin, ia un rucsac pentru pantofi.',
      ),
      TravelActivity(
        title: 'Orașul antic Efes',
        location: 'Izmir, Turcia',
        imageUrl: 'assets/images/efes.jpg',
        rating: 4.8,
        reviews: 11200,
        price: 200,
        description:
            'Vizitează Biblioteca lui Celsus și unul dintre cele mai bine conservate orașe antice.',
        suggestedRestaurant: 'Ejder Restaurant',
        travelTip:
            'Nu este umbră deloc, pălăria și crema de soare sunt obligatorii.',
      ),
      TravelActivity(
        title: 'Cascadele Duden',
        location: 'Antalya, Turcia',
        imageUrl: 'assets/images/antalya.jpg',
        rating: 4.6,
        reviews: 5400,
        price: 50,
        description:
            'O oază de răcoare și natură spectaculoasă chiar lângă Marea Mediterană.',
        suggestedRestaurant: '7 Mehmet',
        travelTip:
            'Poți face un tur cu barca pentru a vedea cascada direct din mare.',
      ),
    ],
  ),

  // --- SPANIA ---
  Country(
    name: 'Spania',
    imageUrl: 'assets/images/spania_cover.jpg',
    description: 'Fiesta, plaje însorite, tapas și arhitectură vibrantă.',
    activities: [
      TravelActivity(
        title: 'Sagrada Familia',
        location: 'Barcelona, Spania',
        imageUrl: 'assets/images/sagrada.jpg',
        rating: 4.9,
        reviews: 45200,
        price: 150,
        description:
            'Capodopera neterminată a lui Gaudi, o minune a luminii și arhitecturii.',
        suggestedRestaurant: 'La Paradeta (Fructe de mare)',
        travelTip:
            'Turnurile se plătesc separat, alege turnul "Nașterii Domnului".',
      ),
      TravelActivity(
        title: 'Palatul Regal',
        location: 'Madrid, Spania',
        imageUrl: 'assets/images/palatul_regal.jpg',
        rating: 4.5,
        reviews: 8900,
        price: 120,
        description:
            'Reședința oficială a familiei regale spaniole, plină de artă și istorie.',
        suggestedRestaurant: 'Mercado de San Miguel (Tapas)',
        travelTip:
            'Intrarea este gratuită de luni până joi, între 16:00 și 18:00.',
      ),
      TravelActivity(
        title: 'Palatul Alhambra',
        location: 'Granada, Spania',
        imageUrl: 'assets/images/alhambra.jpg',
        rating: 4.9,
        reviews: 32000,
        price: 180,
        description:
            'Un complex de palate maure uimitoare cu grădini luxuriante.',
        suggestedRestaurant: 'Restaurante Jardines de Alberto',
        travelTip: 'Biletele se epuizează cu luni înainte, rezervă din timp!',
      ),
      TravelActivity(
        title: 'Park Güell',
        location: 'Barcelona, Spania',
        imageUrl: 'assets/images/park_guell.jpg',
        rating: 4.4,
        reviews: 28000,
        price: 80,
        description:
            'Un parc public plin de mozaicuri colorate și structuri organice create de Gaudi.',
        suggestedRestaurant: 'Tibidabo Brewing',
        travelTip:
            'Zona monumentală necesită bilet, restul parcului este gratuit.',
      ),
      TravelActivity(
        title: 'Catedrala din Sevilla',
        location: 'Sevilla, Spania',
        imageUrl: 'assets/images/sevilla.jpg',
        rating: 4.7,
        reviews: 12500,
        price: 90,
        description:
            'Cea mai mare catedrală gotică din lume și locul de veci al lui Cristofor Columb.',
        suggestedRestaurant: 'El Rinconcillo (Cel mai vechi bar)',
        travelTip: 'Urcă în turnul Giralda, nu sunt scări, ci rampe!',
      ),
    ],
  ),

  // --- AUSTRIA ---
  Country(
    name: 'Austria',
    imageUrl: 'assets/images/austria_cover.jpg',
    description: 'Muntii Alpi, muzică clasică și palate imperiale.',
    activities: [
      TravelActivity(
        title: 'Palatul Schönbrunn',
        location: 'Viena, Austria',
        imageUrl: 'assets/images/schonbrunn.jpg',
        rating: 4.8,
        reviews: 41000,
        price: 140,
        description:
            'Fosta reședință de vară a habsburgilor, cu grădini imperiale vaste.',
        suggestedRestaurant: 'Café Gloriette',
        travelTip:
            'Mergi până la Gloriette pentru cea mai bună priveliște a palatului.',
      ),
      TravelActivity(
        title: 'Satul Hallstatt',
        location: 'Salzkammergut, Austria',
        imageUrl: 'assets/images/hallstatt.jpg',
        rating: 4.9,
        reviews: 15000,
        price: 0,
        description:
            'Cel mai pitoresc sat din Alpi, așezat pe malul unui lac cristalin.',
        suggestedRestaurant: 'Seewirt Zauner (Pește proaspăt)',
        travelTip:
            'Este foarte aglomerat între 11:00 și 15:00, încearcă să ajungi dimineața.',
      ),
      TravelActivity(
        title: 'Fortăreața Hohensalzburg',
        location: 'Salzburg, Austria',
        imageUrl: 'assets/images/hohensalzburg.jpg',
        rating: 4.6,
        reviews: 18000,
        price: 110,
        description:
            'Unul dintre cele mai mari castele medievale din Europa, cu vedere superbă.',
        suggestedRestaurant: 'Stieglkeller',
        travelTip:
            'Ia funicularul la urcare și coboară pe jos pentru a vedea orașul.',
      ),
      TravelActivity(
        title: 'Palatul Belvedere',
        location: 'Viena, Austria',
        imageUrl: 'assets/images/belvedere.jpg',
        rating: 4.7,
        reviews: 22000,
        price: 130,
        description: 'Gazda celebrului tablou "Sărutul" de Gustav Klimt.',
        suggestedRestaurant: 'Salm Bräu',
        travelTip: 'Grădinile dintre cele două palate sunt gratuite.',
      ),
      TravelActivity(
        title: 'Catedrala Sf. Ștefan',
        location: 'Viena, Austria',
        imageUrl: 'assets/images/stephens_dom.jpg',
        rating: 4.5,
        reviews: 35000,
        price: 60,
        description: 'Simbolul Vienei, o capodoperă gotică în inima orașului.',
        suggestedRestaurant: 'Figlmüller (Șnițel vienez)',
        travelTip: 'Poți vizita catacombele de sub catedrală doar cu ghid.',
      ),
    ],
  ),

  // --- GRECIA ---
  Country(
    name: 'Grecia',
    imageUrl: 'assets/images/grecia_cover.jpg',
    description: 'Mitologie, insule paradisiace și ape turcoaz.',
    activities: [
      TravelActivity(
        title: 'Acropola din Atena',
        location: 'Atena, Grecia',
        imageUrl: 'assets/images/acropole.jpg',
        rating: 4.8,
        reviews: 55000,
        price: 100,
        description:
            'Centrul Greciei Antice și locul unde se află legendarul Partenon.',
        suggestedRestaurant: 'Dionysos Zonar\'s',
        travelTip:
            'Vino la ora 8:00 fix pentru a evita căldura și aglomerația.',
      ),
      TravelActivity(
        title: 'Apus în Oia',
        location: 'Santorini, Grecia',
        imageUrl: 'assets/images/santorini.jpg',
        rating: 4.9,
        reviews: 42000,
        price: 0,
        description:
            'Celebrele case albe cu acoperișuri albastre și cel mai frumos apus din lume.',
        suggestedRestaurant: 'Kastro Oia Restaurant',
        travelTip:
            'Pentru un loc bun la apus, trebuie să ajungi cu 2 ore înainte.',
      ),
      TravelActivity(
        title: 'Plaja Navagio (Epava)',
        location: 'Zakynthos, Grecia',
        imageUrl: 'assets/images/zakynthos.jpg',
        rating: 4.7,
        reviews: 19000,
        price: 250,
        description:
            'O plajă izolată accesibilă doar cu barca, faimoasă pentru epava de pe nisip.',
        suggestedRestaurant: 'Taverna Porto Schiza (Sus pe stâncă)',
        travelTip:
            'Priveliștea de sus (de pe stâncă) este mai spectaculoasă decât plaja în sine.',
      ),
      TravelActivity(
        title: 'Mănăstirile de la Meteora',
        location: 'Kalambaka, Grecia',
        imageUrl: 'assets/images/meteora.jpg',
        rating: 4.9,
        reviews: 23000,
        price: 150,
        description:
            'Mănăstiri "suspendate în aer", construite pe vârfuri stâncoase spectaculoase.',
        suggestedRestaurant: 'Meteoron Panorama',
        travelTip:
            'Verifică programul, fiecare mănăstire este închisă într-o zi diferită a săptămânii.',
      ),
      TravelActivity(
        title: 'Palatul Knossos',
        location: 'Creta, Grecia',
        imageUrl: 'assets/images/knossos.jpg',
        rating: 4.5,
        reviews: 14000,
        price: 90,
        description:
            'Centrul civilizației minoice și locul labirintului Minotaurului.',
        suggestedRestaurant: 'Peskesi (Heraklion)',
        travelTip:
            'Ia un ghid local pentru a înțelege cu adevărat ruinele labirintului.',
      ),
    ],
  ),
];
