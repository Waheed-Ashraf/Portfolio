import 'package:flutter/material.dart';
import 'package:portfolio/home/data/models/app_bar_item_model.dart';
import 'package:portfolio/home/presentation/views/widgets/app_bar_widgets/app_bar_text_button.dart';

class CustomAppBarList extends StatefulWidget {
  const CustomAppBarList({super.key});

  @override
  State<CustomAppBarList> createState() => _CustomAppBarListState();
}

class _CustomAppBarListState extends State<CustomAppBarList> {
  static List<AppBarItemModel> appBarData = [
    AppBarItemModel(itemName: "About Me", onTap: () {}),
    AppBarItemModel(itemName: "Education", onTap: () {}),
    AppBarItemModel(itemName: "Skills", onTap: () {}),
    AppBarItemModel(itemName: "Projects", onTap: () {}),
    AppBarItemModel(itemName: "Services", onTap: () {}),
    AppBarItemModel(itemName: "Certifications", onTap: () {}),
    AppBarItemModel(itemName: "Contact", onTap: () {}),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: appBarData.asMap().entries.map(
        (e) {
          int index = e.key;
          return GestureDetector(
              onTap: () {
                if (currentIndex != index) {
                  setState(() {
                    currentIndex = index;
                  });
                }
                appBarData[index].onTap;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AppBarButton(
                  isActive: currentIndex == index,
                  appBarItemModel: appBarData[index],
                ),
              ));
        },
      ).toList(),
    );
  }
}
