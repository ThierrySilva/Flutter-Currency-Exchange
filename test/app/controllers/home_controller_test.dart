import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ola_mundo/app/controllers/home_controller.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromtext = TextEditingController();
  final homeController = HomeController(
    fromtext: fromtext,
    toText: toText,
  );
  //Criando teste
  test("Testando conversão real para dolar", () {
    fromtext.text = '2.0';
    homeController.convert();
    //expect(toText.text, '11.26');
    print(fromtext.text +
        ' em ' +
        homeController.fromCurrency!.name.toString() +
        ' vale ' +
        toText.text +
        ' em ' +
        homeController.toCurrency!.name.toString());
  });
}
