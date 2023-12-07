import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/onboard/on_board_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const OnBoardView(),
      theme: ThemeData.light().copyWith(
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
    );
  }
}
