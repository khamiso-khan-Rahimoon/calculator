import 'package:calculator/buttons.dart';
import 'package:calculator/constrantrs.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        result.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            userInput = '';
                            result = '';
                            setState(() {});
                          },
                          title: 'AC',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                          title: '+/-',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                          title: '%',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          title: '/',
                          color: OrangeColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                          title: '7',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                          title: '8',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                          title: '9',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          title: 'x',
                          color: OrangeColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                          title: '4',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                          title: '5',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                          title: '6',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          title: '-',
                          color: OrangeColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                          title: '1',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                          title: '2',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                          title: '3',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          title: '+',
                          color: OrangeColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyButtons(
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                          title: 'DEL',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                          title: '0',
                        ),
                        MyButtons(
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                          title: '.',
                        ),
                        MyButtons(
                          onPress: () {
                            EqualPress();
                            setState(() {});
                          },
                          title: '=',
                          color: OrangeColor,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void EqualPress() {
    String fiinalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(fiinalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
