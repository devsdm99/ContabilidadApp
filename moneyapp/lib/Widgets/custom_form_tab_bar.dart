import 'package:flutter/material.dart';

class CustomFormTabBar extends StatefulWidget {
  @override
  _CustomFormTabBarState createState() => _CustomFormTabBarState();
}

class _CustomFormTabBarState extends State<CustomFormTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int tabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        setState(() {
          print(index);
          tabIndex = index;
        });
      },
      indicator: BoxDecoration(
          color: tabIndex == 0 ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20)),
      controller: _tabController,
      tabs: [
        Tab(
          text: "Ingreso",
        ),
        Tab(
          text: "Retiro",
        )
      ],
    );
  }
}
