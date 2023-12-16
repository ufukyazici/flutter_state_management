import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_management/feature/travel/view/travel_tab_view.dart';
import 'package:flutter_state_management/product/model/state/project_context.dart';
import 'package:flutter_state_management/product/model/state/user_context.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProjectContext()),
        ProxyProvider<ProjectContext, UserContext>(
          update: (context, projectContext, userContext) {
            return userContext != null
                ? userContext.copyWith(name: projectContext.newUserName)
                : UserContext(projectContext.newUserName);
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: const TravelTabView(),
        theme: ThemeData.light().copyWith(
            tabBarTheme: const TabBarTheme(labelColor: Colors.orange, unselectedLabelColor: Colors.grey),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
      ),
    );
  }
}
