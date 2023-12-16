import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/travel/view/travel_view.dart';

enum _TravelPages { home, bookmark, notification, profile }

class TravelTabView extends StatelessWidget {
  const TravelTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _TravelPages.values.length,
        child: const Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.home)),
              ],
            ),
          ),
          body: TabBarView(children: [
            TravelView(),
            SizedBox(),
            SizedBox(),
            SizedBox(),
          ]),
        ));
  }
}
