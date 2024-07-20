import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator';

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              alignment: Alignment.centerRight,
              child: Text(
                resultText,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(text: '7', onPressed: onDigitClicked),
                CalculatorButton(
                  text: '8',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '9',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '*',
                  onPressed: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(text: '4', onPressed: onDigitClicked),
                CalculatorButton(
                  text: '5',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '6',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '/',
                  onPressed: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(text: '1', onPressed: onDigitClicked),
                CalculatorButton(
                  text: '2',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '3',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '+',
                  onPressed: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(text: '.', onPressed: onDotClicked),
                CalculatorButton(
                  text: '0',
                  onPressed: onDigitClicked,
                ),
                CalculatorButton(
                  text: '=',
                  onPressed: onEqualClicked,
                ),
                CalculatorButton(
                  text: '-',
                  onPressed: onOperatorClicked,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CalculatorButton(text: 'clear', onPressed: onClearClicked),
                CalculatorButton(
                  text: 'back',
                  onPressed: onBackSpaceClicked,
                ),
                CalculatorButton(
                  text: 'sqrt',
                  onPressed: onSqrtClicked,
                ),
                CalculatorButton(
                  text: 'pow',
                  onPressed: onPowerClicked,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClicked(String digit) {
    setState(() {
      resultText += digit;
    });
  }

  String savedNumber = '';
  String savedOperator = '';

  void onOperatorClicked(String operator) {
    if (resultText.isEmpty) return;
    if (savedNumber.isEmpty) {
      savedNumber = resultText;
      savedOperator = operator;
    } else {
      calculate(savedNumber, savedOperator, resultText);
      savedOperator = operator;
      savedNumber = resultText;
    }
    resultText = '';
    setState(() {});
  }

  void calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    switch (operator) {
      case '*':
        resultText = (num1 * num2).toString();
        break;
      case '/':
        resultText = (num1 / num2).toString();
        break;
      case '+':
        resultText = (num1 + num2).toString();
        break;
      case '-':
        resultText = (num1 - num2).toString();
        break;
    }
  }

  void onEqualClicked(String _) {
    if (resultText.isEmpty || savedNumber.isEmpty) return;
    calculate(savedNumber, savedOperator, resultText);
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  void onDotClicked(String _) {
    if (resultText.contains('.')) return;
    resultText += '.';
    setState(() {});
  }

  void onClearClicked(String _) {
    savedNumber = '';
    savedOperator = '';
    resultText = '';
    setState(() {});
  }

  void onBackSpaceClicked(String _) {
    if (resultText.isEmpty)
      return;
    else {
      List result = resultText.split('');
      result.removeAt(result.length - 1);
      resultText = result.join();
      setState(() {});
    }
  }

  double result = 0;
  void onSqrtClicked(String _) {
    if (resultText.isEmpty)
      return;
    else {
      result = double.parse(resultText);
      resultText = (sqrt(result)).toString();
      setState(() {});
    }
  }

  void onPowerClicked(String _) {
    if (resultText.isEmpty)
      return;
    else {
      result = double.parse(resultText);
      resultText = (pow(result, 2)).toString();
      setState(() {});
    }
  }
}
