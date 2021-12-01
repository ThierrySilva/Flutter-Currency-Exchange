import 'package:flutter/material.dart';
import 'package:ola_mundo/app/components/currency_box.dart';
import 'package:ola_mundo/app/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = new TextEditingController();

  final TextEditingController fromText = new TextEditingController();
  HomeController? homeController;

  @override
  void initState() {
    super.initState();
    homeController = new HomeController(fromtext: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 30, left: 30, right: 20),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                child: Image.network(
                    'https://static.vecteezy.com/ti/vetor-gratis/p3/2517923-moeda-cambio-dinheiro-converter-dinheiro-transferencia-icone-de-linha-fina-vetor.jpg'),
              ),
              SizedBox(height: 40),
              CurrencyBox(
                selectedItem: homeController!.fromCurrency,
                controller: homeController!.fromtext,
                item: homeController!.currencies,
                OnChange: (model) {
                  setState(() {
                    homeController!.fromCurrency = model;
                  });
                },
              ),
              SizedBox(height: 20),
              CurrencyBox(
                selectedItem: homeController!.toCurrency,
                controller: homeController!.toText,
                item: homeController!.currencies,
                OnChange: (model) {
                  setState(() {
                    homeController!.toCurrency = model;
                  });
                },
              ),
              SizedBox(height: 50),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  homeController!.convert();
                },
                child: Text('Converter'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
