import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resto_chat/data/chat.dart';
import 'package:resto_chat/pages/home/tabs/chat_tab.dart';
import 'package:resto_chat/pages/home/tabs/components/chat_widget.dart';
import 'package:resto_chat/pages/home/tabs/components/story_list.dart';
import 'package:resto_chat/themes.dart';
import 'package:resto_chat/utils/Singleton.dart';

class ChatTabState extends State<ChatTab> {
  final chats = getChats();
  Color backgroundColor = Singleton().getBGColor();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text('Chat', style: TextStyle(color: Singleton().getChatTitleColor(), fontSize: 26, fontWeight: FontWeight.w700),),
        centerTitle: false,
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(Iconsax.search_normal_1, color: Singleton().getChatTitleColor(), size: 22,),
            onPressed: () {},
          ),
        ],
      ),
      drawer: drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            StoryList(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Chats", style: theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
            Column(
              children: chats.map((e) => Column(
                children: [
                  ChatWidget(chat: e),
                  chats.indexOf(e) != chats.length - 1 ? Divider(indent: 80, height: 1, endIndent: 16,) : SizedBox(),
                ],
              )).toList(),
            ),
          ],
        ),
      ),
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

}
