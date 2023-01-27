import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key, required this.label, required this.onClicked,
  }) : super(key: key);

  final String label;

  final Function() onClicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),   
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            
            onPressed: onClicked, child: Text(label)),
        ),
      ),
    );
  }
}