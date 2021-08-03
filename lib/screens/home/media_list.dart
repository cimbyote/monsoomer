import 'package:flutter/material.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:monsoomer/shared/loading_widget.dart';
import 'package:provider/provider.dart';

import 'media_tile.dart';

class MediaList extends StatefulWidget {
  int inShowConsumedToggle;

  MediaList(this.inShowConsumedToggle);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    if (widget.inShowConsumedToggle == 0) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: userData.inProgressList.length,
        itemBuilder: (context, index) {
          return MediaTile(media: userData.inProgressList[index]);
        },
      );
    } else if (widget.inShowConsumedToggle == 1) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: userData.wantedList.length,
        itemBuilder: (context, index) {
          return MediaTile(media: userData.wantedList[index]);
        },
      );
    } else if (widget.inShowConsumedToggle == 2) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: userData.consumedList.length,
        itemBuilder: (context, index) {
          return MediaTile(media: userData.consumedList[index]);
        },
      );
    }
    else
      {
        return LoadingWidget();
      }
  }
}
