import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/domain/spell/repository/spell_repository.dart';

class AddSpell {
  final SpellRepository repository;

  AddSpell(this.repository);

  Future<void> call(Spell spell) => repository.addSpell(spell);
}