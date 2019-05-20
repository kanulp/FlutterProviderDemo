import 'package:flutter/foundation.dart';

class UnitModel with ChangeNotifier {
  String _unitType = "kg";
  double _unitVal = 0.0;

  double get unitval => _unitVal;
  setUnitVal(double val) => _unitVal = val;

  String get unitType => _unitType;
  setUnitType(String utype) => _unitType = utype;

  void convertToKG() {
    _unitVal *= 2.205;
    notifyListeners();
  }

  void convertToPound() {
    _unitVal /= 2.205;
    notifyListeners();
  }
}
