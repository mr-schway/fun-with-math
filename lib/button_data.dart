import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fun_with_math/consttants.dart';

class ButtonData extends ChangeNotifier {
  List<String> buttonTexts = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'Del',
    '1',
    '2',
    '3',
    '=',
    '',
    '0',
    '',
    '',
  ];

  Color buttonColor = Colors.blueGrey;
  void getButtonColor(String buttonText) {
    if (buttonText == 'C') {
      buttonColor = Colors.red;
    } else if (buttonText == 'Del') {
      buttonColor = Colors.red.shade400;
    } else if (buttonText == '=') {
      buttonColor = Colors.green;
    } else {
      buttonColor = Colors.blueGrey;
    }
  }

  int numberA = 1;
  int numberB = 1;
  var userInput = '';
  void onTap(String value, BuildContext context) {
    if (value == '=') {
      int? result = int.tryParse(userInput);
      if (result != null && result == numberA + numberB) {
        customShowDialog(
          context: context,
          message: 'Correct!',
          onTap: () {
            Navigator.of(context).pop();
            numberA = Random().nextInt(10);
            numberB = Random().nextInt(10);
            userInput = '';
            notifyListeners();
          },
          icon: const Icon(
            Icons.arrow_forward,
            size: 40,
          ),
        );
      } else {
        customShowDialog(
          context: context,
          message: 'Try Again',
          onTap: Navigator.of(context).pop,
          icon: const Icon(
            Icons.rotate_left,
            size: 40,
          ),
        );
      }
    } else if (value == 'C') {
      userInput = '';
    } else if (value == 'Del' && userInput.isNotEmpty) {
      userInput = userInput.substring(0, userInput.length - 1);
    } else if (userInput.length <= 3 && value != '=' && value != 'C' && value != 'Del') {
      userInput += value;
      // print(userInput);
    }
    notifyListeners();
  }

  Future<dynamic> customShowDialog(
      {required BuildContext context,
      required String message,
      required void Function()? onTap,
      required Widget icon}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.blueGrey,
        content: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                message,
                style: kTextStyle,
              ),
              GestureDetector(
                onTap: onTap,
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }

}


// numberA = Random().nextInt(10);
// numberB = Random().nextInt(10);
// Navigator.of(context).pop;