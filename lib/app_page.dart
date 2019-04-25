import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './cart/cart_page.dart';
import './category/category_page.dart';
import './main/main_page.dart';
import './mine/mine_page.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final List<BottomNavigationBarItem> _BottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.person), title: Text("我的"))
  ];

  final List pages = [MainPage(), CategoryPage(), CartPage(), MinePage()];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = pages[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        items: _BottomTabs,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = pages[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
