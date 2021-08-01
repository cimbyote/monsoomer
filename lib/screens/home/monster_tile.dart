import 'package:flutter/material.dart';
import 'package:monsoomer/models/monster.dart';

class MonsterTile extends StatelessWidget {

  final Monster monster;

  MonsterTile({required this.monster});

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
          title: Text(monster.name + " #"+monster.number.toString()),
          subtitle: Text(monster.type),
        ),
      ),
    );
  }
}
