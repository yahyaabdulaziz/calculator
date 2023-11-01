import 'dart:ffi';
import 'package:calculator/calculator/calculator_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  static String routName = "Calculator";

  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State {
  String result_text = "0";
  String operator = "";
  String lhs = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(" My Calculator ",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 25,
            child: Container(
              color: Colors.black12,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    result_text,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 45,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "N2", onClick: onDoublesClick),
                CalculatorButton(digit: "N3", onClick: onDoublesClick),
                CalculatorButton(digit: "%", onClick: onEqualClick),
                CalculatorButton(digit: "C", onClick: onClearClick),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "7", onClick: onDigitClick),
                CalculatorButton(digit: "8", onClick: onDigitClick),
                CalculatorButton(digit: "9", onClick: onDigitClick),
                CalculatorButton(digit: "/", onClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "4", onClick: onDigitClick),
                CalculatorButton(digit: "5", onClick: onDigitClick),
                CalculatorButton(digit: "6", onClick: onDigitClick),
                CalculatorButton(digit: "X", onClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: "1", onClick: onDigitClick),
                CalculatorButton(digit: "2", onClick: onDigitClick),
                CalculatorButton(digit: "3", onClick: onDigitClick),
                CalculatorButton(digit: "-", onClick: onOperatorClick),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(digit: ".", onClick: onDotClick),
                CalculatorButton(digit: "0", onClick: onDigitClick),
                CalculatorButton(digit: "+", onClick: onOperatorClick),
                CalculatorButton(digit: "=", onClick: onEqualClick)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDoublesClick(String clicked_operator) {
    operator = clicked_operator;
    result_text = calcDoubles(result_text, clicked_operator);
    setState(() {});
  }

  void onEqualClick(_) {
    if (result_text.isEmpty) {
      return;
    }
    result_text = calculate(lhs, operator, result_text);
    lhs = "";
    operator = "";
    setState(() {});
  }

  void onDotClick(_) {
    if (result_text.contains('.')) {
      return;
    }
    onDigitClick(".");
    setState(() {});
  }

  void onClearClick(_) {
    result_text = "0";
    setState(() {});
  }

  void onDigitClick(String digit) {
    if (result_text == "0") {
      result_text = "";
    }
    result_text += digit;
    setState(() {});
  }

  void onOperatorClick(String clicked_operator) {
    if (result_text.isEmpty) {
      return;
    }
    if (operator.isEmpty) {
      lhs = result_text;
    } else {
      lhs = calculate(lhs, operator, result_text);
    }
    operator = clicked_operator;
    result_text = "";
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    if (operator == "+") {
      return "${double.parse(lhs) + double.parse(rhs)}";
    } else if (operator == "-") {
      return "${double.parse(lhs) - double.parse(rhs)}";
    } else if (operator == "X") {
      return "${double.parse(lhs) * double.parse(rhs)}";
    } else if (operator == "/") {
      return "${double.parse(lhs) / double.parse(rhs)}";
    } else {
      return "${double.parse(rhs) / 100}";
    }
  }

  String calcDoubles(String lhs, String operator) {
    if (operator == "N2") {
      return "${double.parse(lhs) * double.parse(lhs)}";
    } else if (operator == "N3") {
      return "${double.parse(lhs) * double.parse(lhs) * double.parse(lhs)}";
    }
    return "";
  }
}
