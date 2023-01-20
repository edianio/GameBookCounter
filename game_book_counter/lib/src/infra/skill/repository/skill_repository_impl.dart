import 'dart:collection';
import 'dart:convert';

import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/skill/skill_repository.dart';
import 'package:game_book_counter/src/infra/skill/datasource/skill_datasource.dart';
import 'package:game_book_counter/src/infra/skill/model/skill_dto.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';

class SkillRepositoryImpl implements SkillRepository {
  final SkillDatasource datasource;

  SkillRepositoryImpl(this.datasource);

  @override
  Future<void> addSkill(Skill skill) async {
    SkillDto dto = SkillDto.fromEntity(skill);
    if(dto.id.isEmpty) {
      dto.id = idGenerator();
    }
    await datasource.addSkill(dto);
  }

  @override
  Future<List<Skill>> getAllSkills() async {
    final response = await datasource.getAllSkills();
    return response.map((e) => SkillDto.fromMap(e as Map<String, dynamic>).toEntity()).toList();
  }
}