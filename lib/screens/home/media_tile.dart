import 'package:flutter/material.dart';
import 'package:monsoomer/models/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:monsoomer/shared/constants.dart';
import 'package:monsoomer/shared/loading_widget.dart';

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
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 44,
              minHeight: 64,
              maxWidth: 50,
              maxHeight: 74,
            ),
            child: CachedNetworkImage(
              imageUrl: media.imageString,
              placeholder: (context, url) => LoadingWidget(),
            ),
          ),
          title: Text(media.name + ' (${media.year})'),
          subtitle: Text(getMediaTypeString(media.type)),
        ),
      ),
    );
  }
}
