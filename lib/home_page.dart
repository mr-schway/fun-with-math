import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_with_math/consttants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
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
                      child: const Text(
                        '1 + 1 = ',
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
                itemCount: buttonTexts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        buttonTexts[index],
                        style: kTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
