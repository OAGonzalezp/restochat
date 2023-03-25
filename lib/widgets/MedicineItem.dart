import 'package:flutter/material.dart';
import 'package:resto_chat/themes.dart';

class MedicineItem extends StatelessWidget {
  final Widget widget;
  final String initial;
  final String title;
  final String sender;
  final String message;
  final String time;
  final bool mute;
  final int unread;
  final Color color;
  final Function onTap;

  const MedicineItem({
    Key? key,
    required this.widget,
    required this.initial,
    required this.title,
    required this.sender,
    required this.message,
    required this.time,
    required this.mute,
    required this.unread,
    required this.color,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 25,
        child: initial.isNotEmpty ?
        Text(initial, style: const TextStyle(color: kWhiteColor, fontSize: 20))
            : widget,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(title, style: TextStyle(fontWeight: bold, fontSize: 17, color: kDarkChatTitleColor)),
            const SizedBox(width: 5),
            mute ? const Icon(Icons.volume_off, color: kGreyColor, size: 15) : Container(),
            const Spacer(),
            Text(time, style: const TextStyle(fontSize: 13, color: kDarkChatReadColor)),
          ],
        ),
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                sender.isNotEmpty ?
                Text('$sender: ', maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: kBlue2Color, fontWeight: semiBold),
                ) : Container(),
                Expanded(
                  child: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, color: kDarkChatReadColor),
                  ),
                ),
              ],
            ),
          ),
          unread > 9 ? Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: kDarkChatUnReadColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Text(unread.toString(), style: TextStyle(fontSize: 13, color: kDarkChatTitleColor, fontWeight: semiBold)),
          ) :
          (unread > 0 ?
          CircleAvatar(
            backgroundColor: kDarkChatUnReadColor,
            child: Text(unread.toString(), style: TextStyle(fontSize: 13, color: kDarkChatTitleColor, fontWeight: semiBold)),
            radius: 12,
          ) : Container()
          ),
        ],
      ),
      shape: Border(bottom: BorderSide(color: kDarkChatReadColor, width: 0.5)),
    );
  }
}
