import 'dart:convert';

import 'package:game_book_counter/src/infra/skill/datasource/skill_datasource.dart';
import 'package:game_book_counter/src/infra/skill/model/skill_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

class SkillDatasourceHive implements SkillDatasource{
  @override
  Future<void> addSkill(SkillDto skill) async {
    final box = await Hive.openBox(DbConst.skills);
    await box.put(skill.id, skill.toMap());
  }

  @override
  Future<List> getAllSkills() async {
    final box = await Hive.openBox(DbConst.skills);
    return box.values.cast().map((e) => json.decode(json.encode(e)) as Map<String,dynamic>).toList();
  }
}
