import 'package:flutter/foundation.dart';

class PuntosProvider with ChangeNotifier {
  int _totalPoints = 0;

  int get totalPoints => _totalPoints;

  void addToTotalPoints(int points) {
    _totalPoints += points;
    notifyListeners();
  }

  void subtractPoints(int points) {
    _totalPoints -= points;
    notifyListeners();
  }
}
