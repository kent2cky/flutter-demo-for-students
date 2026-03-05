import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  double result = 0;

  void updateResult(double newResult) {
    result = newResult;
    notifyListeners();
  }
}
