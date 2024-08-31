import 'package:flutter/material.dart';
import 'package:fun_with_math/button_data.dart';
import 'package:fun_with_math/consttants.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final int index;
  const CustomButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonData>(
      builder: (context, buttonData, child) {
        buttonData.getButtonColor(buttonData.buttonTexts[index]);
        return GestureDetector(
          onTap: () {
            buttonData.onTap(buttonData.buttonTexts[index], context);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              margin: const EdgeInsets.all(4),
              color: buttonData.buttonColor,
              child: Center(
                child: Text(
                  buttonData.buttonTexts[index],
                  style: kTextStyle,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
