import 'package:game_book_counter/src/domain/spell/entity/spell.dart';

abstract class SpellsEvent {}

class AddSpellEvent extends SpellsEvent {
  final Spell spell;

  AddSpellEvent(this.spell);
}

class UpdateSpellEvent extends SpellsEvent {
  final Spell spell;

  UpdateSpellEvent(this.spell);
}

class RemoveSpellEvent extends SpellsEvent {
  final String id;

  RemoveSpellEvent(this.id);
}

class GetSpellEvent extends SpellsEvent {
  final String id;

  GetSpellEvent(this.id);
}

class GetAllSpellsEvent extends SpellsEvent {}