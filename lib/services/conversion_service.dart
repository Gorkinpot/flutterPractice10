import 'package:project/models/conversion.dart';

class ConversionService {
  List<Conversion> conversions = [];

  void addConversion(Conversion c) {
    conversions.add(c);
  }

  void clearHistory() {
    conversions.clear();
  }
}
