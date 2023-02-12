import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/domain/spell/repository/spell_repository.dart';
import 'package:game_book_counter/src/infra/spell/datasource/spell_datasource.dart';
import 'package:game_book_counter/src/infra/spell/model/spell_dto.dart';
import 'package:game_book_counter/src/utils/id_generator.dart';

class SpellRepositoryImpl implements SpellRepository {
  final SpellDatasource datasource;

  SpellRepositoryImpl(this.datasource);

  @override
  Future<void> addSpell(Spell spell) async {
    SpellDto dto = SpellDto.fromEntity(spell);
    if(dto.id.isEmpty) {
      dto.id = idGenerator();
    }
    await datasource.addSpell(dto);
  }

  @override
  Stream<List<Spell>> getAllSpells() async* {
    final response = await datasource.getAllSpells();
    yield response.map((e) => SpellDto.fromMap(e as Map<String, dynamic>).toEntity()).toList();
  }
}