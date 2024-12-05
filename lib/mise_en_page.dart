import 'package:flutter/material.dart';
import 'recette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'À propos des crêpes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MiseEnPage(title: 'À propos des crêpes'),
    );
  }
}

class MiseEnPage extends StatefulWidget {
  const MiseEnPage({super.key, required this.title});
  final String title;

  @override
  State<MiseEnPage> createState() => _MyHomePageState();
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(52),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 50), // Pour l'espace entre les parties
          
          // Style de la partie titre 
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 100), // Pour l'espace entre les parties

          // Style de la partie description 
          Text(
            description,
            style: const TextStyle(
              fontSize: 20,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 100), // Pour l'espace entre les parties

          // Creation des etoiles et du 170 avis
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Color.fromARGB(255, 14, 117, 17)),
              Icon(Icons.star, color: Color.fromARGB(255, 14, 117, 17)),
              Icon(Icons.star, color: Color.fromARGB(255, 14, 117, 17)),
              Icon(Icons.star, color: Color.fromARGB(255, 14, 117, 17)),
              Icon(Icons.star_half, color: Color.fromARGB(255, 14, 117, 17)),
              SizedBox(width: 200),
              Text(
                '170 Avis',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 100), // Pour l'espace entre les parties

          // Creation des 3 icons en bas et de leurs text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.access_time_filled, color: Colors.green[500]),
                  const Text('Preparation :'),
                  const Text('10 min'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.onetwothree_outlined, color: Colors.green[500]),
                  const Text('Niveau :'),
                  const Text('1: Facile'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.person, color: Colors.green[500]),
                  const Text('Nb. Pers. :'),
                  const Text('12-15'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MiseEnPage> {
  Icon _coeur = const Icon(Icons.favorite_border_outlined, color: Color.fromARGB(255, 255, 255, 255));
  bool _likeBool = false;


  // Fonction du coeur 
  void _likeThis() {
    setState(() {
      if (_likeBool) {
        _coeur = const Icon(Icons.favorite_border, color: Color.fromARGB(255, 255, 255, 255));
        _likeBool = false;
      } else {
        _coeur = const Icon(Icons.favorite, color: Color.fromARGB(255, 255, 0, 0));
        _likeBool = true; 
      }
    });
  } 
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Creation de AppBar
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color.fromARGB(246, 180, 81, 0),
        // creation du coeur 
        actions: <Widget>[
          IconButton(onPressed: _likeThis, icon: _coeur)
        ],
      ),

      // Creation du body avec (Titre, Description, Image)
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // Partie Gauche
            const Expanded(
              flex: 2,
              child: TextSection(
                title: 'À propos des crêpes',
                description:
                    'Les crêpes sont des délices culinaires originaires de Bretagne, en France.\n'
                    'Elles sont fines et légères, préparées avec une pâte à base de farine, d’œufs, de lait et de beurre.\n'
                    'Servies sucrées ou salées, elles s’accompagnent de confitures, de fruits, de chocolat ou encore de fromage et de jambon.\n'
                    'Polyvalentes et savoureuses, elles sont idéales pour toutes les occasions : petits déjeuners, desserts ou repas festifs.',
              ),
            ),

            const Spacer(), // faire un espace entre la partie a gauche et a droite
            
            // Partie Droite
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50), 
                    child: Image.asset(
                      'images/crepe3-.png',
                      width: 800,
                      height: 800,
                    ),
                  ),
                  // Le bouton est maintenant centré
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Recette(title: 'Recette des meilleurs crepes'),
                        ),
                    );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(246, 180, 81, 0),
                    ),
                    child: const Text(
                      'Voir la recette',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
