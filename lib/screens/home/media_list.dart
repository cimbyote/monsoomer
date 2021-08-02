import 'package:flutter/material.dart';
import 'package:monsoomer/models/media.dart';
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

    final userData = Provider.of<UserData>(context);

    return ListView.builder(
      itemCount: userData.consumedList.length,
      itemBuilder: (context, index) {
        return MediaTile(media: userData.consumedList[index]);
      },
    );
  }
}
