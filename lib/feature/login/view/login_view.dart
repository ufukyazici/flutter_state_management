import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/login/viewModel/login_view_model.dart';
import 'package:flutter_state_management/product/constant/image_enum.dart';
import 'package:flutter_state_management/product/padding/page_padding.dart';
import 'package:flutter_state_management/product/utility/input_decorations.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String _loginTitle = "LOGIN";
  late final LoginViewModel _loginViewModel;
  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const PagePadding.lowAll(),
              child: Column(
                children: [
                  SizedBox(
                      height: context.sized.dynamicHeight(0.3),
                      width: context.sized.dynamicWidth(0.3),
                      child: ImageEnums.door.toImage),
                  Text(_loginTitle),
                  const TextField(
                    decoration: ProjectInputDecoration("Email"),
                  ),
                  const TextField(
                    decoration: ProjectInputDecoration("Password"),
                  ),
                  ElevatedButton(
                      onPressed: _loginViewModel.isLoading
                          ? null
                          : () {
                              _loginViewModel.controlTextValue();
                            },
                      child: const Center(child: Text("Login"))),
                  CheckboxListTile(
                    value: _loginViewModel.isCheckBoxOkay,
                    title: const Text("Remember me"),
                    onChanged: (value) {
                      _loginViewModel.checkBoxChange(value ?? false);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
