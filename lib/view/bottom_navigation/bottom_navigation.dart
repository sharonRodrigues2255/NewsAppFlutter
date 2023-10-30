import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/view/home/homepage.dart';
import 'package:news_app/view/search/search.dart';

ValueNotifier<int> currentIndex = ValueNotifier(0);
final pages = [HomePage(), SearchScreen()];

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: pages[currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: appbarColor,
                selectedFontSize: 16,
                unselectedFontSize: 14,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                onTap: (value) {
                  currentIndex.value = value;
                },
                currentIndex: value,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search")
                ]),
          );
        });
  }
}
