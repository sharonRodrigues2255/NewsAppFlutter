import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/controller/search_controller.dart';
import 'package:news_app/view/bottom_navigation/bottom_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchControllerProvider>(
            create: (context) => SearchControllerProvider()),
        ChangeNotifierProvider<HomepageController>(
            create: (context) => HomepageController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        home: BottomNavigation(),
      ),
    );
  }
}
