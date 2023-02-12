import 'package:game_book_counter/src/domain/spell/repository/spell_repository.dart';
import 'package:game_book_counter/src/domain/spell/use_cases/add_spell.dart';
import 'package:game_book_counter/src/domain/spell/use_cases/get_all_spells.dart';
import 'package:game_book_counter/src/external/datasource/spell/spell_datasource_hive.dart';
import 'package:game_book_counter/src/infra/spell/datasource/spell_datasource.dart';
import 'package:game_book_counter/src/infra/spell/repository/spell_repository_impl.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/spells/bloc/spells_bloc.dart';

void serviceLocatorSpells() {
  // DATASOURCE
  getIt.registerLazySingleton<SpellDatasource>(() => SpellDatasourceHive());
  // REPOSITORY
  getIt.registerLazySingleton<SpellRepository>(() => SpellRepositoryImpl(getIt()));
  // USE CASES
  getIt.registerLazySingleton<AddSpell>(() => AddSpell(getIt()));
  getIt.registerLazySingleton<GetAllSpells>(() => GetAllSpells(getIt()));
  // BLOC
  getIt.registerSingleton<SpellsBloc>(SpellsBloc(addSpell: getIt(), getAllSpells: getIt()));
}