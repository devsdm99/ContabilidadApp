import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

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
      labelColor: Colors.black,
      labelStyle: const TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600), //For Selected tab
      unselectedLabelStyle: const TextStyle(
          fontSize: 18.0,
          color: Colors.black54,
          fontWeight: FontWeight.normal), //For Un-selected Tabs
      isScrollable: true,
      controller: _tabController,
      indicatorPadding: EdgeInsets.only(bottom: -4),
      indicator: UnderlineTabIndicator(
        borderSide: const BorderSide(
          width: 3.0,
          color: Color.fromRGBO(40, 48, 120, 1),
        ),
        insets: EdgeInsets.only(left: 16.0, right: 55),
      ),
      tabs: [
        Text("History"),
        Text("Statistics"),
      ],
    );
  }
}
