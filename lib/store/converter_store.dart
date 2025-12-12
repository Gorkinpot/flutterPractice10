import 'package:mobx/mobx.dart';
import 'package:project/models/conversion.dart';
import 'package:project/services/conversion_service.dart';

part 'converter_store.g.dart';

class ConverterStore = _ConverterStore with _$ConverterStore;

abstract class _ConverterStore with Store {
  final ConversionService _service;

  _ConverterStore(this._service);

  @observable
  String fromCurrency = 'USD';

  @observable
  String toCurrency = 'EUR';

  @observable
  double amount = 0.0;

  @observable
  double result = 0.0;

  @action
  void setFromCurrency(String? value) {
    if (value == null) return;
    fromCurrency = value;
  }

  @action
  void setToCurrency(String? value) {
    if (value == null) return;
    toCurrency = value;
  }


  @action
  void setAmount(double value) => amount = value;

  @action
  void convert() {
    result = amount * 0.9;
    _service.addConversion(Conversion(
      fromCurrency: fromCurrency,
      toCurrency: toCurrency,
      amount: amount,
      result: result,
      timestamp: DateTime.now(),
    ));
  }
}
