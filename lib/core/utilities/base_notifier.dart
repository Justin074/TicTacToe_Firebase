import 'package:flutter/material.dart';

typedef ClassCreator<T> = T Function();

class BaseNotifier<T> extends ChangeNotifier {
  late ValueNotifier<T> valueNotifier;

  /// Usage:
  /// Give the creator an empty instance of your class
  /// eg. T = List<int>
  /// classCreator = () => <int>[]
  final ClassCreator<T> classCreator;

  BaseNotifier({
    required this.classCreator,
  }) {
    valueNotifier = ValueNotifier<T>(classCreator());
  }

  void notifyClients() {
    valueNotifier.notifyListeners();
  }
}
