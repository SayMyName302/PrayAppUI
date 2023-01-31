import 'package:flutter/material.dart';

class HorizontalTabs extends StatefulWidget {
  @override
  _HorizontalTabsState createState() => _HorizontalTabsState();
}

class _HorizontalTabsState extends State<HorizontalTabs> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
      viewportFraction: 0.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Tab(text: "Tab 1"),
          Tab(text: "Tab 2"),
          Tab(text: "Tab 3"),
        ],
      ),
    );
  }
}
