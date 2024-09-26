import 'package:flutter/material.dart';
import 'package:flutter_mapa/mapa.dart';
import 'package:flutter_mapa/modelo.dart';

class Home extends StatelessWidget {
  final Modelo modelo = Modelo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aventura no Mapa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem-vindo à sua aventura!'),
            const Text('Você está em um mapa com 2 terrenos.'),
            const Text('Sua missão é encontrar a porta de saída.'),
            ElevatedButton(
              onPressed: () {
                // Navegar para a próxima tela (mapa)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mapa(modelo: modelo,)),
                );
              },
              child: Text('Iniciar Jogo'),
            ),
          ],
        ),
      ),
    );
  }
}
