import 'package:flutter/material.dart';
import '../Screens/homeScreen.dart';
import '../Screens/contactScreen.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  // init list of tabsbar
  final List<Map<String, Object>> _listTabsbar = [
    {
      'title': 'Sample Github Dashboard',
      'body': HomeScreen(),
      'icon': Icons.home,
    },
    {
      'title': 'Contact',
      'body': ContactScreen(),
      'icon': Icons.message,
    }
  ];
  // init index of tabsbar
  int _indexTabsbar = 0;
  // select a tabs
  void _selectTabsbar(index) {
    setState(() {
      _indexTabsbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(_listTabsbar[_indexTabsbar]['title'],
          style: TextStyle(color: Colors.white)),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height - appBar.preferredSize.height,
        child: _listTabsbar[_indexTabsbar]['body'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexTabsbar,
        onTap: _selectTabsbar,
        items: _listTabsbar
            .map((e) => BottomNavigationBarItem(
          icon: Icon(e['icon']),
          title: Text(''),
        ))
            .toList(),
      ),
    );
  }
}