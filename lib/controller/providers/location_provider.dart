import 'package:flutter/foundation.dart';

class LocationProvider extends ChangeNotifier {
  bool isSelected = false;

  // Method to toggle the selection state and notify listeners
  void toggleSelected() {
    isSelected = !isSelected;
    print(isSelected);
    notifyListeners();
  }
}
