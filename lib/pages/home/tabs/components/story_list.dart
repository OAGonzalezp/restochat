import 'package:resto_chat/data/user.dart';
import 'package:resto_chat/models/story/story.dart';
import 'package:resto_chat/models/user/user.dart';
import 'package:resto_chat/pages/home/tabs/components/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resto_chat/utils/Singleton.dart';

class StoryList extends StatefulWidget {
  const StoryList({Key? key}) : super(key: key);

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  final stories = [
    Story(url: 'https://images.pexels.com/photos/838875/pexels-photo-838875.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200'),
    Story(url: 'https://images.pexels.com/photos/1438275/pexels-photo-1438275.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200'),
    Story(url: 'https://images.pexels.com/photos/576924/pexels-photo-576924.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb'),
    Story(url: 'https://images.pexels.com/photos/247206/pexels-photo-247206.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200'),
    Story(url: 'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200'),
    Story(url: 'https://images.pexels.com/photos/1878522/pexels-photo-1878522.jpeg?auto=compress&cs=tinysrgb&h=350'),
    Story(url: 'https://images.pexels.com/photos/247917/pexels-photo-247917.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb'),
    Story(url: 'https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200'),
    Story(url: 'https://images.pexels.com/photos/1758845/pexels-photo-1758845.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200'),
  ];

  final User user = getUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Singleton().getBGColor()),
      height: 60,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              width: 60,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Singleton().getActive2Color(),
                border: Border.all(color: Singleton().getChatTitleColor(), width: 2),
              ),
              child: Center(
                child: Icon(Iconsax.add, color: Singleton().getChatTitleColor(), size: 30,),
              ),
            );
          }

          return InkWell(
            onTap: () => Navigator.pushNamed(context, '/story', arguments: user),
            child: StoryWidget(image: stories[index].url,));
        },
      ),
    );
  }
}
