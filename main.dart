import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favoritos(),
    );
  }
}

class Favoritos extends StatefulWidget {
  @override
  ContagemFavoritos createState() => ContagemFavoritos();
}

class ContagemFavoritos extends State<Favoritos> {
  int favoritos = 0;

  final List<Contato> contatos = [
    Contato(
      nome: 'Amanda',
      email: 'amandadantasds',
      imagem: 'https://i.pravatar.cc/150?img=%27',
    ),
    Contato(
      nome: 'Gabriel',
      email: 'gabrielduarte',
      imagem: 'https://i.pravatar.cc/120?img=2',
    ),
  ];

  void toggleFavorito(int index) {
    setState(() {
      contatos[index].favoritado = !contatos[index].favoritado;
      // Atualiza o contador:
      if (contatos[index].favoritado) {
        favoritos++;
      } else {
        favoritos--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos $favoritos', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contatos[index].imagem),
            ),
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              onPressed: () => toggleFavorito(index),
              icon: Icon(
                contatos[index].favoritado
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: contatos[index].favoritado ? Colors.red : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Contato {
  final String imagem;
  final String nome;
  final String email;
  bool favoritado;

  Contato({
    required this.imagem,
    required this.nome,
    required this.email,
    this.favoritado = false, 
  });
}
