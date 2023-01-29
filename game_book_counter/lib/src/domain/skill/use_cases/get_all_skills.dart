import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/domain/skill/repository/skill_repository.dart';

class GetAllSkills {
  final SkillRepository repository;

  GetAllSkills(this.repository);

  Future<List<Skill>> call() => repository.getAllSkills();
}