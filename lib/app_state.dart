import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _rareza = 0;
  double get rareza => _rareza;
  set rareza(double value) {
    _rareza = value;
  }

  int _todos = 0;
  int get todos => _todos;
  set todos(int value) {
    _todos = value;
  }

  int _raros = 0;
  int get raros => _raros;
  set raros(int value) {
    _raros = value;
  }

  int _normalidadmaxima = 0;
  int get normalidadmaxima => _normalidadmaxima;
  set normalidadmaxima(int value) {
    _normalidadmaxima = value;
  }

  double _indicederareza = 0.0;
  double get indicederareza => _indicederareza;
  set indicederareza(double value) {
    _indicederareza = value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
