import 'package:flutter/material.dart';

class BottomNavigationModel extends ChangeNotifier {
  int currentIndex = 0;

  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
