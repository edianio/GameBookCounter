import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

abstract class SkillsState {}

class SkillsLoadingState extends SkillsState {}

class SkillsLoadedState extends SkillsState {
  final List<Skill> skills;

  SkillsLoadedState({required this.skills});
}

class SkillsExceptionState extends SkillsState {
  final String error;

  SkillsExceptionState(this.error);
}