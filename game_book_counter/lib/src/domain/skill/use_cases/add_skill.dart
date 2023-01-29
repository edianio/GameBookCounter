import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/skill/repository/skill_repository.dart';

class AddSkill {
  final SkillRepository repository;

  AddSkill(this.repository);

  Future<void> call(Skill skill) => repository.addSkill(skill);
}