import 'package:game_book_counter/src/infra/spell/model/spell_dto.dart';

abstract class SpellDatasource {
  Future<void> addSpell(SpellDto spell);
  Future<List> getAllSpells();
}