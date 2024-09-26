import 'package:flutter/material.dart';
import 'package:flutter_mapa/modelo.dart';

class ChaveColetada extends StatelessWidget {
  final Modelo modelo;

  const ChaveColetada({super.key, required this.modelo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parabéns!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Você pegou a chave!'),
            ElevatedButton(
              onPressed: () {
                // Todo 2: chame modelo.removeChave() aqui.
                Navigator.pop(context); // Voltar para o mapa
              },
              child: const Text('Voltar ao Mapa'),
            ),
          ],
        ),
      ),
    );
  }
}