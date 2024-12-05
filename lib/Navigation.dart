import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Démo Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Premiere Page de Flutter'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 4, 212, 195),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Ecran n°1",
              style: TextStyle(
                fontSize: 100,
                color: Color.fromARGB(246, 162, 103, 2),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 22, 121, 11),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  const MySecondPage(title: "Deuxieme Page de Flutter"),
            ),
          );
        },
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Suivant !",
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(246, 0, 0, 0),
            ),
            ),
        ),
      ),
    );
  }
}

class MySecondPage extends StatelessWidget {
  final String title;
  const MySecondPage({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 2, 163, 150),
      ),
      body: const Center(
        child: Text(
          "Ecran n°2",
          style: TextStyle(
            fontSize: 100,
            color: Color.fromARGB(246, 162, 103, 2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromARGB(255, 138, 5, 5),
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Precedent !",
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(246, 0, 0, 0),
            ),
          ),
        ),
      ),
    );
  }
}
