import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/onboard/on_board_model.dart';

class OnBoardCard extends StatelessWidget {
  const OnBoardCard({super.key, required this.onBoardModel});
  final OnBoardModel onBoardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(onBoardModel.title),
        Text(onBoardModel.description),
        Image.asset(onBoardModel.imageWithPath),
      ],
    );
  }
}
