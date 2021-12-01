import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_mundo/app/models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel>? item;
  final CurrencyModel? selectedItem;
  final TextEditingController? controller;
  final void Function(CurrencyModel? model)? OnChange;

  CurrencyBox(
      {Key? key, this.item, this.controller, this.OnChange, this.selectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 57,
              child: DropdownButton<CurrencyModel>(
                iconEnabledColor: Colors.amber,
                isExpanded: true,
                value: selectedItem,
                underline: Container(height: 1, color: Colors.amber),
                items: item!
                    .map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.name!)))
                    .toList(),
                onChanged: OnChange,
              ),
            )),
        SizedBox(width: 20),
        Expanded(
          flex: 2,
          child: TextField(
              controller: controller!,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
              )),
        )
      ],
    );
  }
}
