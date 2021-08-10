import 'package:flutter/material.dart';
import 'package:monsoomer/models/media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:monsoomer/screens/home/detailed_media_page.dart';
import 'package:monsoomer/shared/constants.dart';
import 'package:monsoomer/shared/loading_widget.dart';

class MediaTile extends StatelessWidget {
  final Media media;

  MediaTile({required this.media});

  @override
  Widget build(BuildContext context) {
    //TODO: make clickable for more info
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
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                reverse: true,
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  //child: SearchResultDetailPage(tappedMediaItem:searchResultList[index]),
                  child: DetailedMediaPage(tappedMediaItem: media,),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
