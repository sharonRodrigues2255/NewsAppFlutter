import 'package:flutter/material.dart';
import 'package:news_app/controller/homepage_controller.dart';
import 'package:news_app/view/home/homepage.dart';

class HorizondalScrollingCategory extends StatelessWidget {
  const HorizondalScrollingCategory({
    super.key,
    required this.provider,
  });

  final HomepageController provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              provider.setCategories(index);

              provider.fetchdatacategories();
            },
            child: Container(
              decoration: BoxDecoration(
                color: index == provider.categoriesIndex
                    ? Colors.redAccent
                    : Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              width: 100,
              height: 40,
              child: Center(child: Text(categories[index])),
            ),
          ),
        );
      },
    );
  }
}
