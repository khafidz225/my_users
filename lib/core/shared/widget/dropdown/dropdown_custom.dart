import 'package:flutter/material.dart';

class DropdownCustom extends StatelessWidget {
  DropdownCustom(
      {required this.onChanged,
      required this.items,
      required this.isConditionNull,
      required this.controller,
      this.labelText,
      this.hintText,
      super.key});
  List<DropdownMenuItem<dynamic>>? items;
  TextEditingController controller;
  bool isConditionNull;
  void Function(dynamic value)? onChanged;
  String? labelText;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return isConditionNull
        ? TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
              enabled: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        : DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: labelText,
              hintText: hintText,
            ),
            autofocus: false,
            focusColor: Colors.white,
            items: items,
            onChanged: (value) {
              controller.text = value;
              onChanged!(value);
            },
          );
  }
}
