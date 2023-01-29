import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

abstract class SkillEvent {}

class AddSkillEvent extends SkillEvent {
  final Skill skill;

  AddSkillEvent(this.skill);
}

class UpdateSkillEvent extends SkillEvent {
  final Skill skill;

  UpdateSkillEvent(this.skill);
}

class RemoveSkillEvent extends SkillEvent {
  final String id;

  RemoveSkillEvent(this.id);
}

class GetSkillEvent extends SkillEvent {
  final String id;

  GetSkillEvent(this.id);
}

class GetAllSkillsEvent extends SkillEvent {}