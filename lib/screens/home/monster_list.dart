import 'package:flutter/material.dart';
import 'package:monsoomer/models/monster.dart';
import 'package:provider/provider.dart';

class MonsterList extends StatefulWidget {
  const MonsterList({Key? key}) : super(key: key);

  @override
  _MonsterListState createState() => _MonsterListState();
}

class _MonsterListState extends State<MonsterList> {
  @override
  Widget build(BuildContext context) {

    final monsters = Provider.of<List<Monster>>(context);
    monsters.forEach((monster) {
      print(monster.name);
      print(monster.type);
      print(monster.number);
    });

    return Container();
  }
}

