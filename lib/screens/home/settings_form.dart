import 'package:flutter/material.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:monsoomer/services/database_service.dart';
import 'package:monsoomer/shared/constants.dart';
import 'package:monsoomer/shared/loading_widget.dart';
import 'package:monsoomer/widgets/rounded_square_button.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> types = ['Grass', 'Fire', 'Water', 'Electric'];

  //form values
  late String _currentName = '';
  late String _currentType = '';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserInfoModel?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userDataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;


            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your monster settings',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: userData!.media.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val!.isEmpty ? 'Please Enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: userData.media.type,
                    items: types.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text('$type type'),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => _currentType = val.toString()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedSquareButton(
                    buttonText: 'Update',
                    textColor: Colors.white,
                    onPressedCallback: () async {
                      if (_formKey.currentState!.validate()) {
                        if (_currentName == '') {
                          _currentName = userData.media.name;
                        }
                        if (_currentType == '') {
                          _currentType = userData.media.type;
                        }
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentName,
                          _currentType,
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            );
          } else {
            return LoadingWidget();
          }
        });
  }
}
