import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resto_chat/pages/home/tabs/chat_tab.dart';
import 'package:resto_chat/pages/home/tabs/explore_tab.dart';
import 'package:resto_chat/pages/home/tabs/notification_tab.dart';
import 'package:resto_chat/themes.dart';
import 'package:resto_chat/utils/Singleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = <Widget>[
    ExploreTab(),
    ChatTab(),
    NotificationTab()
  ];

  late PageController _pageController;
  int currentTab = 1;

  goToTab(int page) {
    setState(() {
      currentTab = page;
    });

    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Singleton().getBGColor(),
      body: PageView(
        children: tabs,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Singleton().getBGColor(),
        elevation: 0,
        notchMargin: 10,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _bottomAppBarItem(icon: Iconsax.home5, page: 0),
              _bottomAppBarItem(icon: Iconsax.message5, page: 1),
              _bottomAppBarItem(icon: Iconsax.notification5, page: 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem({icon, page}) {
    return IconButton(
      splashRadius: 20,
      onPressed: () => goToTab(page),
      icon: Icon(
        icon, 
        color: currentTab == page ? kDarkActiveColor : Colors.blueGrey.shade200,
        size: 22,
      ),
    );
  }
}
