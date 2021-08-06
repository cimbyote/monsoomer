import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:monsoomer/models/mediaFromAPI.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/shared/loading_widget.dart';
import 'package:monsoomer/widgets/rounded_square_button.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SearchResultDetailPage extends StatelessWidget {
  int showConsumedToggle = 0;
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
      height: MediaQuery.of(context).size.height - 160,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              height: 250,
              imageUrl: displayImage,
              placeholder: (context, url) => LoadingWidget(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  tappedMediaItem.title,
                  maxLines: 1,
                  maxFontSize: 32.0,
                  style: TextStyle(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tappedMediaItem.year,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tappedMediaItem.type,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Which List would you like to add this to?',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                child: ToggleSwitch(
                  minWidth: 180.0,
                  minHeight: 50.0,
                  initialLabelIndex: showConsumedToggle,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 3,
                  labels: [
                    'In Progress List',
                    'Wanted List',
                    'Consumed List',
                  ],
                  iconSize: 30.0,
                  borderColor: [
                    Color(0xff3b5998),
                    Color(0xff8b9dc3),
                    Color(0xff00aeff),
                    Color(0xff0077f2),
                    Color(0xff962fbf),
                    Color(0xff4f5bd5)
                  ],
                  dividerColor: Colors.blueGrey,
                  activeBgColors: [
                    [Color(0xff3b5998), Color(0xff8b9dc3)],
                    [Color(0xff00aeff), Color(0xff0077f2)],
                    [
                      Color(0xfffeda75),
                      Color(0xfffa7e1e),
                      Color(0xffd62976),
                      Color(0xff962fbf),
                      Color(0xff4f5bd5)
                    ]
                  ],
                  onToggle: (index) {
                    // setState(() {
                    //   showConsumedToggle = index;
                    // });
                  },
                ),
              ),
              RoundedSquareButton(
                buttonText: 'Add To List',
                onPressedCallback: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
