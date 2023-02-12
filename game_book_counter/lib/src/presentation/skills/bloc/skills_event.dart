import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

abstract class SkillsEvent {}

class AddSkillEvent extends SkillsEvent {
  final Skill skill;

  AddSkillEvent(this.skill);
}

class UpdateSkillEvent extends SkillsEvent {
  final Skill skill;

  UpdateSkillEvent(this.skill);
}

class RemoveSkillEvent extends SkillsEvent {
  final String id;

  RemoveSkillEvent(this.id);
}

class GetSkillEvent extends SkillsEvent {
  final String id;

  GetSkillEvent(this.id);
}

class GetAllSkillsEvent extends SkillsEvent {}