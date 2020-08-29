import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int _count = 0;

  getCount() => _count;
  setCount(int count) => _count = count;

  void increment() {
    _count += 1;
    notifyListeners();
  }
}
