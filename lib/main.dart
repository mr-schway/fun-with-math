import 'package:flutter/material.dart';
import 'package:fun_with_math/button_data.dart';
import 'package:fun_with_math/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ButtonData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey[300],
        ),
        home: const HomePage(),
      ),
    );
  }
}
