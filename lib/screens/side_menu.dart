import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monsoomer/services/auth_service.dart';


class SideMenu extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
        ),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                'Monsoomer',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            Column(
              children: [
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
                    // _showSettingsPanel();
                  },
                ),
                ListTile(
                  title: Text(
                    'Things',
                  ),
                  onTap: () {
                    //Navigator.pushNamed(context, AddListScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
