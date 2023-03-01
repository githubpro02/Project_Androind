// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("So thap phan");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "AC") {
      _output = "\n0";
      output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, String bcolor) {
    var cMap = {
      "yellow": Colors.yellow,
      "red": Colors.red,
      "blue": Colors.blue
    };

    var co = cMap[bcolor];
    return new Expanded(
      child: new OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: co,
          padding: const EdgeInsets.all(24.0),
        ),
        child: new Text(
          buttonText,
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(output,
                    style: new TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ))),
            new Expanded(
              child: new Divider(),
            ),
            new Column(children: [
              Row(children: [buildButton("AC", "red")]),
              new Row(children: [
                buildButton("7", "blue"),
                buildButton("8", "blue"),
                buildButton("9", "blue"),
                buildButton("+", "yellow")
              ]),
              new Row(children: [
                buildButton("4", "blue"),
                buildButton("5", "blue"),
                buildButton("6", "blue"),
                buildButton("-", "yellow")
              ]),
              new Row(children: [
                buildButton("1", "blue"),
                buildButton("2", "blue"),
                buildButton("3", "blue"),
                buildButton("X", "yellow")
              ]),
              new Row(children: [
                buildButton("0", "blue"),
                buildButton(".", "blue"),
                buildButton("=", "red"),
                buildButton("/", "yellow")
              ]),
            ])
          ],
        ));
  }
}
