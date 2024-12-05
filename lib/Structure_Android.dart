import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deuxieme_Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Ma Deuxieme Application Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _coeur = const Icon(Icons.favorite_border, color: Colors.white);
  bool _likeBool = false;
  var _selectedIndex = 0;
  String _affichage = "Accueil";

  void _likeThis() {
    setState(() {
      if (_likeBool) {
        _coeur = const Icon(Icons.favorite_border, color: Colors.white);
        _likeBool = false;
      } else {
        _coeur = const Icon(Icons.favorite, color: Colors.white);
        _likeBool = true; 
      }
    });
  }

  void _itemClique(int index){
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _affichage = "Accueil";
      }
      else if (_selectedIndex == 1) {
        _affichage = "Profil";
      }
      else {
        _affichage = "Paramètres";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Creation de la barre d'application
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style : const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(246, 180, 81, 0),
        actions: <Widget>[
          IconButton(onPressed: _likeThis, icon: _coeur)
        ],
      ),

      // Creation de la BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mon compte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: 'Paramétres',
          ),
        ],
        onTap: _itemClique,
        currentIndex: _selectedIndex,
      ),

      // Creation du drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(246, 180, 81, 0),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('Accueil'),
              onTap: () {
                _itemClique(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Mon compte'),
              onTap: () {
                _itemClique(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Paramètres'),
              onTap: () {
                _itemClique(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Creation du corps de l'application
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            // padding / Image a gauche
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 20.0),
              child: Image.asset('images/one_piece.png'),
            ),

            // Pour mettre le Texte au centre
            Expanded(
              child: Center(
                child: Text(
                  _affichage,
                  style: const TextStyle(
                    color: Color.fromARGB(246, 180, 81, 0),
                    fontSize: 50, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),

            // padding / Image a droite
            Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 20.0, bottom: 20.0),
              child: Image.network('https://tse3.mm.bing.net/th?id=OIP._YA5UN2DeRv9OLieB4aNHQHaNK&pid=Api'),
            ),
          ],
        ),
      ),

      // Localisation du bouton flottant parapluie
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // Creation du bouton flottant parapluie
      floatingActionButton: FloatingActionButton(
        onPressed: _likeThis,
        tooltip: 'parapluie',
        backgroundColor: Colors.green,
        child: const Icon(Icons.beach_access),
      ),
    );
  }
}
