import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monsoomer/models/mediaFromAPI.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/shared/loading_widget.dart';

class SearchResultDetailPage extends StatelessWidget {
  MediaFromAPI tappedMediaItem;

  SearchResultDetailPage({required this.tappedMediaItem});

  @override
  Widget build(BuildContext context) {
    String displayImage;

    if (tappedMediaItem.imageString != 'N/A') {
      displayImage = tappedMediaItem.imageString;
    } else {
      //TODO: find better placeholder
      displayImage = 'https://i.stack.imgur.com/y9DpT.jpg';
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.loose,
            child: CachedNetworkImage(
              imageUrl: displayImage,
              placeholder: (context, url) => LoadingWidget(),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Text(
              tappedMediaItem.title,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Text(
              tappedMediaItem.year,
              style: TextStyle(fontSize: 12),
            ),
          ),

        ],
      ),
    );
  }
}
