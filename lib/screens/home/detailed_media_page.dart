import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monsoomer/models/mediaFromAPI.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/seriesDetailsFromAPI.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:monsoomer/services/database_service.dart';
import 'package:monsoomer/shared/loading_widget.dart';
import 'package:monsoomer/widgets/detailed_media_widget.dart';
import 'package:monsoomer/widgets/rounded_square_button.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:monsoomer/services/api_service.dart';

//TODO: search different API for more detailed info
class DetailedMediaPage extends StatefulWidget {
  late bool loadFlag = false;

  final Media tappedMediaItem;

  DetailedMediaPage({required this.tappedMediaItem});

  @override
  _DetailedMediaPageState createState() => _DetailedMediaPageState();
}

class _DetailedMediaPageState extends State<DetailedMediaPage> {
  APIService _apiService = APIService();
  SeriesDetailsFromAPI detailedTappedMediaItem = SeriesDetailsFromAPI();

  bool loading = true;

  int showConsumedToggle = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.loadFlag == false) {
      _apiService
          .searchAPIForDetailedInfo(widget.tappedMediaItem.apiID)
          .then((value) {
        detailedTappedMediaItem = value;
        setState(() {
          loading = false;
          widget.loadFlag = true;
        });
      });
    } else {
      loading = false;
    }

    String displayImage;

    if (widget.tappedMediaItem.imageString != 'N/A') {
      displayImage = widget.tappedMediaItem.imageString;
    } else {
      //TODO: find better placeholder
      displayImage = 'https://i.stack.imgur.com/y9DpT.jpg';
    }
    return loading
        ? PageLoadingWidget()
        : Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView(
              children: [
                //TODO: cache detailed data on local file to reduce # of queries
                DetailedMediaWidget(
                    displayImage: displayImage,
                    detailedTappedMediaItem: detailedTappedMediaItem),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Display number of seasons
                  //Let me select which seasons I have watched
                  //Delete from list
                  //move to a different list [context based]
                  children: [
                    Row(
                      children: [
                        Text('Seasons'),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          child: Column(
                            children: [
                              Icon(Icons.delete_forever),
                              Text("Delete"),
                            ],
                          ),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: Column(
                            children: [
                              Icon(Icons.trending_flat),
                              Text("Move to..."),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
