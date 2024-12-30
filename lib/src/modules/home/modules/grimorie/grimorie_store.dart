import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/entities/grimoire/grimoire.dart';

class GrimorieStore extends ChangeNotifier {
  GrimorieStore(this._grimoire);

  late Grimoire _grimoire;
  Grimoire get grimoire => _grimoire;
  void updateGrimorie(Grimoire value) {
    _grimoire = value;
    notifyListeners();
  }
}
