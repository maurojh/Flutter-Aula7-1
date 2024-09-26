import 'package:flutter/material.dart';
import 'package:flutter_mapa/chave_coletada.dart';
import 'package:flutter_mapa/modelo.dart';

class Mapa extends StatefulWidget {
  final Modelo modelo; // Injeta o modelo no construtor

  const Mapa({super.key, required this.modelo});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  // ... (outros métodos para gerenciar o estado da tela)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(3, (index) {
            return GestureDetector(
              onTap: () => _mudaDeTerreno(index),
              child: Container(
                color: widget.modelo.isPlayerOn(index)
                    ? Colors.blue
                    : const Color.fromARGB(255, 170, 96, 96),
                child: Center(
                  child: _mostraItens(index),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void _mudaDeTerreno(int tappedIndex) {
    // Check if the tapped position is a valid move for the player
    if (widget.modelo.canMoveTo(tappedIndex)) {
      final itemPego = widget.modelo.getItemOn(tappedIndex);
      if (itemPego == 'chave') {
        widget.modelo.items[tappedIndex] = null; // Remover chave do mapa
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChaveColetada(modelo: widget.modelo)),
        );
      } else {
        widget.modelo.movePlayer(tappedIndex);
        setState(() {});
      }
    }
  }

  Icon _mostraItens(int index) {
    if (widget.modelo.getItemOn(index) == 'chave') {
      return const Icon(Icons.key); // Exibir ícone da chave
    } else if (widget.modelo.getItemOn(index) == 'porta') {
      return const Icon(Icons.door_sliding);
    } else {
      return const Icon(Icons.place);
    }
  }
}
