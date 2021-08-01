import 'package:flutter/material.dart';
import 'package:monsoomer/models/monster.dart';
import 'package:provider/provider.dart';

import 'monster_tile.dart';

class MonsterList extends StatefulWidget {
  const MonsterList({Key? key}) : super(key: key);

  @override
  _MonsterListState createState() => _MonsterListState();
}

class _MonsterListState extends State<MonsterList> {
  @override
  Widget build(BuildContext context) {

    final monsters = Provider.of<List<Monster>>(context);

    return ListView.builder(
      itemCount: monsters.length,
      itemBuilder: (context, index) {
        return MonsterTile(monster: monsters[index]);
      },
    );
  }
}
