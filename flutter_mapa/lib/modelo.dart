import 'dart:math';

import 'package:flutter/foundation.dart';

class Modelo extends ChangeNotifier {
  int playerPosition = 1; // Posição inicial (canto superior esquerdo)
  List<String?> items = List.filled(3, null); // Lista para armazenar os itens

  Modelo() {
    final random = Random();
    if(random.nextBool()) {
      items[0] = 'chave';
      items[2] = 'porta';
    } else {
      items[2] = 'chave';
      items[0] = 'porta';
    }
  }

  // Todo 1: crie o método removeChave()

  void movePlayer(int newPosition) {
    playerPosition = newPosition;
    notifyListeners();
  }

  bool isPlayerOn(int position) {
    return playerPosition == position;
  }

  String? getItemOn(int position) {
    return items[position];
  }

  bool canMoveTo(int newPosition) {
    if(newPosition == playerPosition || newPosition > playerPosition + 1 || newPosition < playerPosition - 1) {
      return false;
    } else {
      return true;
    }
  }
}