import 'package:flutter/material.dart';
import 'package:monsoomer/models/media.dart';

class MediaTile extends StatelessWidget {

  final Media media;

  MediaTile({required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.red,
          ),
          title: Text(media.name),
          subtitle: Text(media.type),
        ),
      ),
    );
  }
}
