import 'package:flutter/material.dart';
import 'package:resto_chat/themes.dart';

import '../widgets/ChatItem.dart';
import 'NewMessage.dart';

class RecentScreen extends StatelessWidget {
  const RecentScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kDarkBGColor,
      appBar: appBar(),
      drawer: drawer(),
      body: body(),
      floatingActionButton: fab(context),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: kDarkToolBarColor,
      elevation: 2,
      title: const Text('RestoChat'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded),
        ),
      ],
    );
  }

  Widget drawer() {
    return Drawer(
      backgroundColor: kDarkProfile2Color,
      child: ListView(

        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kDarkProfileColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: kBlue5Color,
                    child: Text('U1',
                      style: TextStyle(fontSize: 24, fontWeight: semiBold, color: kWhiteColor),
                    ),
                    radius: 34,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('User 1', style: TextStyle(color: kWhiteColor, fontSize: 16)),
                          SizedBox(height: 5),
                          Text('+62 802 0220055', style: TextStyle(color: kLightGreyColor)),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down_rounded,
                            color: kWhiteColor, size: 34,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.group_outlined),
            title: const Text('New Group'),
            onTap: () {},
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Contacts'),
            onTap: () {},
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.call_outlined),
            title: const Text('Calls'),
            onTap: () {},
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.accessibility_new_sharp),
            title: const Text('People Nearby'),
            onTap: () {},
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.bookmark_border_rounded),
            title: const Text('Saved Messages'),
            onTap: () {},
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            trailing: const CircleAvatar(
              backgroundColor: kBlue4Color,
              child: Text('!', style: TextStyle(color: kWhiteColor)),
              radius: 12,
            ),
            onTap: () {},
          ),
          const Divider(thickness: 1),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.group),
            title: const Text('Invite Friends'),
            onTap: () {},
          ),
          ListTile(
            textColor: kDarkChatTitleColor,
            iconColor: kDarkChatTitleColor,
            leading: const Icon(Icons.group),
            title: const Text('Telegram Features'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget body() {
    return ListView(
      padding: const EdgeInsets.only(bottom: 100),
      children: const [
        ChatItem(widget: FlutterLogo(size: 40), initial: '', title: 'Flutter Indonesia', sender: 'User 3', message: 'Hello. Does anyone know how can i directly on/off', time: '22:14', mute: false, unread: 1280, color: Colors.transparent),
        ChatItem(widget: FlutterLogo(size: 40), initial: '', title: 'FlutterDev', sender: '', message: 'New post on /r/flutterdev subreddit:', time: '9:28', mute: true, unread: 8, color: Colors.transparent),
        ChatItem(widget: FlutterLogo(), initial: 'U1', title: 'User 2', sender: '', message: 'Hi, how are you ?', time: '7:34', mute: false, unread: 2, color: kOrangeColor),
        ChatItem(widget: FlutterLogo(), initial: 'U2', title: 'User 3', sender: '', message: 'Hi, how are you ?', time: 'Tue', mute: true, unread: 0, color: kGreenPeasColor),
        ChatItem(widget: FlutterLogo(), initial: 'OG', title: 'Oswaldo Gonzalez', sender: '', message: 'Hi, how are you this morning and so this evening?', time: 'Tue', mute: true, unread: 1, color: kGreenPeasColor),
      ],
    );
  }

  Widget fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewMessage()));
      },
      backgroundColor: kBlue3Color,
      child: const Icon(Icons.edit_rounded),
    );
  }
}
