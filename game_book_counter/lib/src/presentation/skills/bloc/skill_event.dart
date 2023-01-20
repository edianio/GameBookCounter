import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

abstract class SkillEvent {}

class SkillAddEvent extends SkillEvent {
  final Skill skill;

  SkillAddEvent(this.skill);
}

class SkillUpdateEvent extends SkillEvent {
  final Skill skill;

  SkillUpdateEvent(this.skill);
}

class SkillRemoveEvent extends SkillEvent {
  final String id;

  SkillRemoveEvent(this.id);
}

class SkillGetEvent extends SkillEvent {
  final String id;

  SkillGetEvent(this.id);
}

class SkillGetAllEvent extends SkillEvent {}