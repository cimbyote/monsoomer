import 'package:flutter/material.dart';
import 'package:monsoomer/models/media_model.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:provider/provider.dart';

import 'media_tile.dart';

class MediaList extends StatefulWidget {
  const MediaList({Key? key}) : super(key: key);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  @override
  Widget build(BuildContext context) {

    final monsters = Provider.of<UserData>(context);

    return ListView.builder(
      //itemCount: monsters.length,
      itemCount: 1,
      itemBuilder: (context, index) {
        return MediaTile(media: monsters.media);
        //return MediaTile(monster: monsters[index]);
      },
    );
  }
}
