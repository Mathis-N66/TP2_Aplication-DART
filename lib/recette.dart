import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recette des meilleurs crepes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Recette(title: 'Recette des meilleurs crepes'),
    );
  }
}

class Recette extends StatefulWidget {
  const Recette({super.key, required this.title});
  final String title;

  @override
  State<Recette> createState() => _MyHomePageState();
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
          const SizedBox(height: 20), // Espacement

          // Titre
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50), // Espacement

          // Description
          Text(
            description,
            style: const TextStyle(
              fontSize: 20,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50), // Espacement

          // Étoiles et avis
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
                '170k Avis',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50), // Espacement

          // Informations supplémentaires
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.access_time_filled, color: Colors.green[500]),
                  const Text('Préparation :'),
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


class _MyHomePageState extends State<Recette> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Création de l'AppBar
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(246, 180, 81, 0),
      ),

      // Création du corps
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Partie gauche
            const Expanded(
              flex: 2,
              child: TextSection(
                title: 'Recette des meilleurs crêpes',
                description:
                    'Étape 1\n'
                    '- Mettre la farine dans une terrine et former un puits.\n'
                    'Étape 2\n'
                    '- Y déposer les oeufs entiers, le sucre, l\'huile et le beurre.\n'
                    'Étape 3\n'
                    '- Mélanger délicatement avec un fouet en ajoutant au fur et à mesure le lait. La pâte ainsi obtenue doit avoir une consistance d\'un liquide légèrement épais.\n'
                    'Étape 4\n'
                    '- Parfumer de rhum.\n'
                    'Étape 5\n'
                    '- Faire chauffer une poêle antiadhésive et la huiler très légèrement à l\'aide d\'un papier Essuie-tout. Y verser une louche de pâte, la répartir dans la poêle puis attendre qu\'elle soit cuite d\'un côté avant de la retourner. Cuire ainsi toutes les crêpes à feu doux.',
                    
              ),
            ),
            const Spacer(),

            // Partie droite
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0, right: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            switch (index) {
                              case 0:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/farine.jpg',
                                  quantity: '300 g',
                                  name: 'de farine',
                                );
                              case 1:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/lait.jpg',
                                  quantity: '60 cl',
                                  name: 'de lait',
                                );
                              case 2:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/beurre.jpg',
                                  quantity: '50 g',
                                  name: 'de beurre fondu',
                                );
                              case 3:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/oeufs.jpg',
                                  quantity: '3',
                                  name: 'œufs entiers',
                                );
                              case 4:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/rhum.jpg',
                                  quantity: '5 cl',
                                  name: 'de rhum',
                                );
                              case 5:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/sucre.jpg',
                                  quantity: '3 cuillères à soupe',
                                  name: 'de sucre',
                                );
                              default:
                                return const IngredientTile(
                                  imagePath: '../assets/images/ingredients/huile.jpg',
                                  quantity: '3 cuillères à soupe',
                                  name: 'd\'huiles',
                                );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class IngredientTile extends StatelessWidget {
  final String imagePath;
  final String quantity;
  final String name;

  const IngredientTile({
    super.key,
    required this.imagePath,
    required this.quantity,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 150, 
            height: 150,
          ),
          const SizedBox(height: 8),
          Text(
            quantity,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
