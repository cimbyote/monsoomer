import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monsoomer/models/media.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:monsoomer/screens/home/settings_form.dart';
import 'package:monsoomer/services/auth_service.dart';
import 'package:monsoomer/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'media_list.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int showConsumedToggle = 0;

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
            // child: SettingsForm(),
            child: Text("settings form"),
          );
        },
      );
    }

    return StreamProvider<UserData>.value(
      value: DatabaseService(uid: Provider.of<UserInfoModel?>(context)!.uid)
          .userDataStream,
      initialData: UserData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              label: Text('Logout'),
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            TextButton.icon(
              label: Text('Settings'),
              icon: Icon(Icons.settings),
              onPressed: () {
                _showSettingsPanel();
              },
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: [
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
                    setState(() {
                      showConsumedToggle = index;
                    });
                  },
                ),
              ),
              MediaList(showConsumedToggle),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: toggle consumed or want lists
//TODO: add to list

//TODO: setup API for search
