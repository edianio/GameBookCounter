import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

abstract class SkillState {}

class SkillsLoadingState extends SkillState {}

class SkillsLoadedState extends SkillState {
  final List<Skill> skills;

  SkillsLoadedState({required this.skills});
}

class SkillsExceptionState extends SkillState {
  final String error;

  SkillsExceptionState(this.error);
}