import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_management/feature/login/view/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const LoginView(),
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
    );
  }
}
