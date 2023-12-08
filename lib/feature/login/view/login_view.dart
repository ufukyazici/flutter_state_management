import 'package:flutter/material.dart';
import 'package:flutter_state_management/product/constant/image_enum.dart';
import 'package:kartal/kartal.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  final String _loginTitle = "LOGIN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
              height: context.sized.dynamicHeight(0.3),
              width: context.sized.dynamicWidth(0.3),
              child: ImageEnums.door.toImage),
          Text(_loginTitle)
        ],
      ),
    );
  }
}
