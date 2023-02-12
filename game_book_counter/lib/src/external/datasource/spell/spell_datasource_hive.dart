import 'dart:convert';

import 'package:game_book_counter/src/infra/spell/datasource/spell_datasource.dart';
import 'package:game_book_counter/src/infra/spell/model/spell_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

class SpellDatasourceHive implements SpellDatasource {
  @override
  Future<void> addSpell(SpellDto spell) async {
    final box = await Hive.openBox(DbConst.spells);
    await box.put(spell.id, spell.toMap());
  }

  @override
  Future<List> getAllSpells() async {
    final box = await Hive.openBox(DbConst.spells);
    return box.values.cast().map((e) => json.decode(json.encode(e)) as Map<String,dynamic>).toList();
  }

}