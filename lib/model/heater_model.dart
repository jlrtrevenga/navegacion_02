import 'package:flutter/foundation.dart';

class Heater extends ChangeNotifier {
  //late Sensor roomSensorT;
  //late Sensor heaterSensorT;
  //late Sensor setpointT;
  String _modo = 'Auto';
  bool _ajusteManual = false;
  double _ajusteManualValue = 0;

  set modo(modo) {
    _modo = modo;
    notifyListeners();
  }

  String get modo {
    return (_modo);
  }

  set ajusteManual(ajusteManual) {
    _ajusteManual = ajusteManual;
    notifyListeners();
  }

  bool get ajusteManual {
    return (_ajusteManual);
  }

  set ajusteManualIncrement(ajusteManualIncrement) {
    _ajusteManualValue = _ajusteManualValue + ajusteManualIncrement;
    notifyListeners();
  }

  set ajusteManualValue(ajusteManualValue) {
    _ajusteManualValue = _ajusteManualValue;
    notifyListeners();
  }

  double get ajusteManualValue {
    return (_ajusteManualValue);
  }
}

class Sensor {
  late String id;
  late double temperatura;
}
