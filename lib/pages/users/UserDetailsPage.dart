import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resto_chat/models/user/user.dart';
import 'package:resto_chat/pages/home/tabs/notification_tab.dart';
import 'package:resto_chat/pages/users/UsersPage.dart';
import 'package:resto_chat/screens/MedicinesScreen.dart';
import 'package:resto_chat/themes.dart';
import 'package:resto_chat/utils/Singleton.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;
  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  late PageController _pageController;
  int currentTab = 0;

  goToTab(int page) {
    setState(() {
      currentTab = page;
    });

    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Singleton().getBGColor(),
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Singleton().getProfileColor(),
      elevation: 2,
      title: Text(widget.user.name),
    );
  }

  Scaffold body() {
    return Scaffold(
      backgroundColor: Singleton().getBGColor(),
      body: PageView(
        children: [
          MedicinesScreen(user: widget.user),
          UsersPage(),
          NotificationTab()
        ],
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