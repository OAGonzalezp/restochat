import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resto_chat/data/user.dart';
import 'package:resto_chat/pages/home/tabs/components/UserWidget.dart';
import 'package:resto_chat/pages/users/UserForm.dart';
import 'package:resto_chat/screens/NewMessage.dart';
import 'package:resto_chat/themes.dart';
import 'package:resto_chat/utils/Singleton.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  Color _backgroundColor = Singleton().getBGColor();
  final users = getUsers();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Singleton().getBGColor(),
      appBar: AppBar(
        backgroundColor: Singleton().getProfileColor(),
        elevation: 2,
        title: Text('Afiliados',
          style: TextStyle(color: Singleton().getChatTitleColor(), fontSize: 26, fontWeight: FontWeight.w700),
        ),
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
              Column(
                children: users.map((e) => Column(
                  children: [
                    UserWidget(user: e),
                    Divider(indent: 80, height: 1, endIndent: 16,color: Singleton().getChatTitleColor(),)                  ],
                )).toList(),
              ),
          ],
        ),
      ),
      floatingActionButton: fab(context),
    );
  }


  Widget drawer() {
    return Drawer(
      backgroundColor: Singleton().getProfile2Color(),
      child: ListView(

        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Singleton().getProfileColor(),
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
                        children: [
                          Text('User 1', style: TextStyle(color: Singleton().getChatTitleColor(), fontSize: 16)),
                          SizedBox(height: 5),
                          Text('+62 802 0220055', style: TextStyle(color: Singleton().getChatTitleColor())),
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
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.group_outlined),
            title: const Text('New Group'),
            onTap: () {},
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.person_outline_rounded),
            title: const Text('Contacts'),
            onTap: () {},
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.call_outlined),
            title: const Text('Calls'),
            onTap: () {},
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.accessibility_new_sharp),
            title: const Text('People Nearby'),
            onTap: () {},
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.bookmark_border_rounded),
            title: const Text('Saved Messages'),
            onTap: () {},
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
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
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.group),
            title: const Text('Invite Friends'),
            onTap: () {},
          ),
          ListTile(
            textColor: Singleton().getChatTitleColor(),
            iconColor: Singleton().getChatTitleColor(),
            leading: const Icon(Icons.group),
            title: const Text('Telegram Features'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget fab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserForm()));
      },
      backgroundColor: kBlue3Color,
      child: const Icon(Icons.add_reaction_outlined),
    );
  }

}
