import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

abstract class SkillRepository {
  Future<void> addSkill(Skill skill);
  Future<List<Skill>> getAllSkills();
}