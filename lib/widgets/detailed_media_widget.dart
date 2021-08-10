import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monsoomer/models/seriesDetailsFromAPI.dart';
import 'package:monsoomer/shared/loading_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedMediaWidget extends StatelessWidget {
  const DetailedMediaWidget({
    Key? key,
    required this.displayImage,
    required this.detailedTappedMediaItem,
  }) : super(key: key);

  final String displayImage;
  final SeriesDetailsFromAPI detailedTappedMediaItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 2,
                child: Card(
                  child: CachedNetworkImage(
                    height: 250,
                    imageUrl: displayImage,
                    placeholder: (context, url) => LoadingWidget(),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          detailedTappedMediaItem.title ?? 'NULL',
                          maxLines: 2,
                          maxFontSize: 32.0,
                          style: TextStyle(fontSize: 32),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          detailedTappedMediaItem.year ?? 'NULL',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          detailedTappedMediaItem.type ?? 'NULL',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          detailedTappedMediaItem.actors ?? 'NULL',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          detailedTappedMediaItem.runtime ?? 'NULL',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Genre: ' + (detailedTappedMediaItem.genre ?? '')),
                        Text('Rated: ' + (detailedTappedMediaItem.rated ?? '')),
                        Text('Released: ' + (detailedTappedMediaItem.released ?? '')),
                        Text('Rated: ' + (detailedTappedMediaItem.rated ?? '')),
                        SelectableLinkify(
                          onOpen: _onOpen,
                          text:
                          "IMDB Link: https://www.imdb.com/title/${detailedTappedMediaItem.imdbID}/",
                          options: LinkifyOptions(humanize: true),
                        ),
                        detailedTappedMediaItem.type == 'series'
                            ? Text('Total Seasons: ' +
                            (detailedTappedMediaItem.totalSeasons ?? ''))
                            : Text(''),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Plot: ' + (detailedTappedMediaItem.plot ?? '')),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
