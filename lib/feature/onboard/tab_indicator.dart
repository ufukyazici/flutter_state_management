import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/onboard/on_board_model.dart';

class TabIndicator extends StatefulWidget {
  const TabIndicator({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  State<TabIndicator> createState() => _TabIndicatorState();
}

class _TabIndicatorState extends State<TabIndicator> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void didUpdateWidget(covariant TabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.animateTo(widget.selectedIndex);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: OnBoardModels.onBoardItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
    );
  }
}
