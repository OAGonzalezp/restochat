import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resto_chat/models/user/user.dart';
import 'package:resto_chat/pages/users/UserDetailsPage.dart';
import 'package:resto_chat/utils/Singleton.dart';

class UserWidget extends StatefulWidget {
  final User user;
  const UserWidget({Key? key, required this.user}) : super(key: key);

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(user: widget.user)));
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: CachedNetworkImageProvider(widget.user.profile),
      ),
      title: Text(widget.user.name, style: TextStyle(color: Singleton().getChatTitleColor()),),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      subtitle: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(widget.user.eps.name, style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade400),),
      ),
      trailing: widget.user.id > 0 ? Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
            ),
            child: Text(widget.user.id.toString(), style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),),
          ),
          SizedBox(height: 8,),
          Text('Activo', style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade300),),
        ],
      ) : Text('Activo', style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade300),),
    ); 
  }
}
