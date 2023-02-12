import 'package:game_book_counter/src/domain/spell/entity/spell.dart';

abstract class SpellsState {}

class SpellsLoadingState extends SpellsState {}

class SpellsLoadedState extends SpellsState {
  final List<Spell> spells;

  SpellsLoadedState({required this.spells});
}

class SpellsExceptionState extends SpellsState {
  final String error;

  SpellsExceptionState(this.error);
}