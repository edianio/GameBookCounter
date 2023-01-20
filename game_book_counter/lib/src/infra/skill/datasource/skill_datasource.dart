import 'package:game_book_counter/src/infra/skill/model/skill_dto.dart';

abstract class SkillDatasource {
  Future<void> addSkill(SkillDto skill);
  Future<List> getAllSkills();
}