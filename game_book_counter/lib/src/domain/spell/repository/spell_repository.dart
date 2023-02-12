import 'package:game_book_counter/src/domain/spell/entity/spell.dart';

abstract class SpellRepository {
  Future<void> addSpell(Spell spell);
  // Future<void> updateSpell(Spell spell);
  // Future<void> removeSpell(String id);
  // Future<Spell> getSpell(String id);
  Stream<List<Spell>> getAllSpells();
}