import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contatos Favoritos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [
    Contato(name: "Ricardo", email: "ricardo123@gmail.com"),
    Contato(name: "Felipe", email: "felipe123@gmail.com"),
  ];

  String title = "Favoritos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title (${contatos.where((c) => c.favorito).length})",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          final contato = contatos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.indigo,
                child: Text(
                  contato.name[0].toUpperCase(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              title: Text(
                contato.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(contato.email),
              trailing: IconButton(
                icon: Icon(
                  contato.favorito ? Icons.favorite : Icons.favorite_border,
                  color: contato.favorito ? Colors.redAccent : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    contato.favorito = !contato.favorito;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Contato {
  String name;
  String email;
  bool favorito = false;

  Contato({required this.name, required this.email});
}
