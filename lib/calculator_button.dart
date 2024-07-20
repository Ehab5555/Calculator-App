import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  void Function(String) onPressed;
  CalculatorButton({required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(1),
        child: ElevatedButton(
          onPressed: () {
            onPressed(text);
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
