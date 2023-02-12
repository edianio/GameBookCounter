import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/domain/spell/repository/spell_repository.dart';

class GetAllSpells {
  final SpellRepository repository;

  GetAllSpells(this.repository);

  Stream<List<Spell>> call() => repository.getAllSpells();
}