import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resto_chat/pages/call/video/video_call_page.dart';
import 'package:resto_chat/pages/home/home_page.dart';
import 'package:resto_chat/pages/message_page.dart';
import 'package:resto_chat/pages/story/story_page.dart';
import 'package:resto_chat/screens/RecentScreen.dart';
import 'package:resto_chat/screens/AnimatedSplashScreen.dart';
import 'package:resto_chat/themes.dart';
import 'package:resto_chat/utils/Singleton.dart';

import 'models/constants/RoutesConstant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kDarkBGColor,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kDarkBGColor,
        backgroundColor: Singleton().getBGColor(),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kDarkBGColor),
      ),
      home: const AnimatedSplashScreen(),
      routes: <String, WidgetBuilder>{
        RECENT_SCREEN: (BuildContext context) => const RecentScreen(),
        HOME_SCREEN: (context) => const HomePage(),
        MESSAGE_SCREEN: (context) => const MessagePage(),
        STORY_SCREEN: (context) => const StoryPage(),
        CALL_SCREEN:(context) => VideoCallPage(),
      },
    );
  }
}
