import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_management/feature/onboard/on_board_model.dart';
import 'package:flutter_state_management/feature/onboard/tab_indicator.dart';
import 'package:flutter_state_management/product/padding/page_padding.dart';
import 'package:flutter_state_management/product/widget/on_board_card.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = 'Skip';
  int _selectedIndex = 0;

  void _incrementAndChange() {
    if (_selectedIndex == OnBoardModels.onBoardItems.length - 1) {
      return;
    }
    _incrementPageIndex();
  }

  void _incrementPageIndex() {
    setState(() {
      _selectedIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [TabIndicator(selectedIndex: _selectedIndex), _nextButton()],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(_skipTitle, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey)))
      ],
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_left_outlined, color: Colors.grey)),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(
          onBoardModel: OnBoardModels.onBoardItems[index],
        );
      },
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      onPressed: _incrementAndChange,
      child: const Text('Next'),
    );
  }
}
