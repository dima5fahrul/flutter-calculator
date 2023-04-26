import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        fixedSize: const Size(70, 70),
        shape: const CircleBorder(),
      ),
      child: Text(
        btnText,
        style: TextStyle(
          color: txtColor,
          fontSize: 26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    answerFirstNumber == ''
                        ? ''
                        : '$answerFirstNumber $answerOperation $answerSecondNumber',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    text == '' ? '0' : text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton('C', Colors.grey, Colors.black),
                numButton('+/-', Colors.grey, Colors.black),
                numButton('%', Colors.grey, Colors.black),
                numButton('/', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton('7', Colors.grey[850]!, Colors.white),
                numButton('8', Colors.grey[850]!, Colors.white),
                numButton('9', Colors.grey[850]!, Colors.white),
                numButton('x', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton('4', Colors.grey[850]!, Colors.white),
                numButton('5', Colors.grey[850]!, Colors.white),
                numButton('6', Colors.grey[850]!, Colors.white),
                numButton('-', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                numButton('1', Colors.grey[850]!, Colors.white),
                numButton('2', Colors.grey[850]!, Colors.white),
                numButton('3', Colors.grey[850]!, Colors.white),
                numButton('+', Colors.orange, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[850]!,
                    fixedSize: const Size(150, 70),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
                numButton('.', Colors.grey[850]!, Colors.white),
                numButton('=', Colors.orange, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int firstNumber = 0;
  int secondNumber = 0;
  String result = '';
  String text = '';
  String operation = '';
  String answerFirstNumber = '';
  String answerSecondNumber = '';
  String answerOperation = '';
  bool found = false;
  String temp = '';

  void calculate(String btnText) {
    if (kDebugMode) {
      print('awal : $found');
    }

    if (found == false) {
      if (btnText == 'C') {
        result = '';
        text = '';
        firstNumber = 0;
        secondNumber = 0;
        operation = '';
        answerFirstNumber = '';
        answerSecondNumber = '';
        answerOperation = '';
        found = false;
      } else if (btnText == '+' ||
          btnText == '-' ||
          btnText == 'x' ||
          btnText == '/') {
        if (kDebugMode) {
          print('dalam if : $found');
        }
        answerFirstNumber = text;
        answerOperation = btnText;
        firstNumber = int.parse(text);
        result = '';
        operation = btnText;
        found = false;
      } else if (btnText == '=') {
        answerSecondNumber = text;
        secondNumber = int.parse(text);
        if (operation == '+') {
          result = (firstNumber + secondNumber).toString();
          found = true;
        }
        if (operation == '-') {
          result = (firstNumber - secondNumber).toString();
          found = true;
        }
        if (operation == 'x') {
          result = (firstNumber * secondNumber).toString();
          found = true;
        }
        if (operation == '/') {
          result = (firstNumber / secondNumber).toString();
          found = true;
        }
      } else {
        result = int.parse(text + btnText).toString();
        found = false;
      }
    } else {
      if (btnText == 'C') {
        result = '';
        text = '';
        firstNumber = 0;
        secondNumber = 0;
        operation = '';
        answerFirstNumber = '';
        answerSecondNumber = '';
        answerOperation = '';
        found = false;
      } else if (btnText == '+' ||
          btnText == '-' ||
          btnText == 'x' ||
          btnText == '/') {
        if (kDebugMode) {
          print('dalam else : $found');
        }
        answerFirstNumber = text;
        answerSecondNumber = '';
        answerOperation = btnText;
        firstNumber = int.parse(text);
        result = '';
        operation = btnText;
        found = false;
      }
    }

    setState(() {
      text = result;
    });
  }
}


// print('awal : $found');

//     if (found == false) {
//       if (btnText == 'C') {
//         result = '';
//         text = '';
//         firstNumber = 0;
//         secondNumber = 0;
//         operation = '';
//         answerFirstNumber = '';
//         answerSecondNumber = '';
//         answerOperation = '';
//         found = false;
//         temp = '';
//       } else if (btnText == '+' ||
//           btnText == '-' ||
//           btnText == 'x' ||
//           btnText == '/') {
//         answerFirstNumber = text;
//         answerOperation = btnText;
//         firstNumber = int.parse(text);
//         result = '';
//         operation = btnText;
//         print('dalam if firstNumber : $firstNumber');
//         print('dalam if : $found');

//         if (temp == '') {
//           secondNumber = 0;
//         } else {
//           secondNumber = int.parse(temp);
//         }
//         print('dalam if secondNumber : $secondNumber');
//         if (operation == '+') {
//           temp = (firstNumber + secondNumber).toString();
//           found = true;
//         }
//         if (operation == '-') {
//           temp = (firstNumber - secondNumber).toString();
//           found = true;
//         }
//         if (operation == 'x') {
//           temp = (firstNumber * secondNumber).toString();
//           found = true;
//         }
//         if (operation == '/') {
//           temp = (firstNumber / secondNumber).toString();
//           found = true;
//         }
//         print(temp);
//         print('dalam if hasil : $found');
//       } else if (btnText == '=') {
//         answerSecondNumber = text;
//         secondNumber = int.parse(text);
//         if (operation == '+') {
//           result = (firstNumber + secondNumber).toString();
//           found = true;
//         }
//         if (operation == '-') {
//           result = (firstNumber - secondNumber).toString();
//           found = true;
//         }
//         if (operation == 'x') {
//           result = (firstNumber * secondNumber).toString();
//           found = true;
//         }
//         if (operation == '/') {
//           result = (firstNumber / secondNumber).toString();
//           found = true;
//         }
//         print('dalam if hasil : $found');
//       } else {
//         result = int.parse(text + btnText).toString();
//         found = false;
//         print('temp : $temp');
//         print('dalam if else : $found');
//         print('input : $result');
//       }
//     } else {
//       if (btnText == 'C') {
//         result = '';
//         text = '';
//         firstNumber = 0;
//         secondNumber = 0;
//         operation = '';
//         answerFirstNumber = '';
//         answerSecondNumber = '';
//         answerOperation = '';
//         found = false;
//         temp = '';
//       } else if (btnText == '+' ||
//           btnText == '-' ||
//           btnText == 'x' ||
//           btnText == '/') {
//         answerSecondNumber = '';
//         firstNumber = int.parse(temp);
//         secondNumber = int.parse(text);
//         result = '';
//         answerOperation = btnText;
//         operation = btnText;

//         if (operation == '+') {
//           temp = (firstNumber + secondNumber).toString();
//           found = true;
//         }
//         if (operation == '-') {
//           temp = (firstNumber - secondNumber).toString();
//           found = true;
//         }
//         if (operation == 'x') {
//           temp = (firstNumber * secondNumber).toString();
//           found = true;
//         }
//         if (operation == '/') {
//           temp = (firstNumber / secondNumber).toString();
//           found = true;
//         }
//         print('dalam else hasil : $firstNumber $answerOperation $secondNumber');
//         print(temp);
//         answerFirstNumber = temp;
//         print('dalam else : $found');
//       } else {
//         result = int.parse(text + btnText).toString();
//         found = true;
//         print('temp : $temp');
//         print('dalam else else : $found');
//         print('input : $result');
//       }
//     }
