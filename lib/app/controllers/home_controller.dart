import 'package:flutter/material.dart';
import 'package:ola_mundo/app/models/currency_model.dart';

class HomeController {
  List<CurrencyModel>? currencies;
  final TextEditingController? toText;
  final TextEditingController? fromtext;
  CurrencyModel? fromCurrency;
  CurrencyModel? toCurrency;
  double? returnedValue;

  HomeController({this.fromtext, this.toText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies![0];
    toCurrency = currencies![2];
  }

  void convert() {
    String text = (fromtext as TextEditingController).text;
    double value = double.tryParse(text) ?? 1.0;
    switch (toCurrency!.name) {
      case 'Real':
        {
          double valor = toCurrency!.real as double;
          returnedValue = value * valor;
          break;
        }
      case 'Dolar':
        {
          double valor = toCurrency!.real as double;
          returnedValue = value * valor;
          break;
        }
      case 'Euro':
        {
          double valor = toCurrency!.real as double;
          returnedValue = value * valor;
          break;
        }
      case 'Bitcoin':
        {
          double valor = toCurrency!.real as double;
          returnedValue = value * valor;
          break;
        }
      default:
    }

    (toText as TextEditingController).text = returnedValue!.toStringAsFixed(2);
  }
}
