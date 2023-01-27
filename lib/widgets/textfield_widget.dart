import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  const TextField1(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.enabled = true,
      required this.validatetextfield,
      required this.upperText})
      : super(key: key);
  final String labelText;
  final TextEditingController controller;
  final bool enabled;
  final Function validatetextfield;
  final String upperText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextFormField(
            validator: (value) => validatetextfield(value),
            enabled: enabled,
            controller: controller,
            decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                hintText: labelText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          ),
        ],
      ),
    );
  }
}
