import 'package:flutter/material.dart';
import 'package:fun_with_math/button_data.dart';
import 'package:fun_with_math/consttants.dart';
import 'package:fun_with_math/utils/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ButtonData>(
      builder: (context, buttonData, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            leading: const Icon(
              Icons.settings,
              size: 35,
            ),
            title: const Text(
              'Fun With Math',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          width: 250,
                          height: 70,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(4),
                          child: Text(
                            '${buttonData.numberA} + ${buttonData.numberB} = ${buttonData.userInput}',
                            style: kTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: buttonData.buttonTexts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return CustomButton(
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
