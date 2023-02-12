import 'package:game_book_counter/src/domain/player/repository/player_character_repository.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player_skill.dart';
import 'package:game_book_counter/src/domain/player/use_cases/add_player_spell.dart';
import 'package:game_book_counter/src/domain/player/use_cases/get_player.dart';
import 'package:game_book_counter/src/domain/player/use_cases/player_set_exp.dart';
import 'package:game_book_counter/src/domain/player/use_cases/player_set_level.dart';
import 'package:game_book_counter/src/domain/player/use_cases/remove_player_skill.dart';
import 'package:game_book_counter/src/domain/player/use_cases/remove_player_spell.dart';
import 'package:game_book_counter/src/domain/player/use_cases/update_player.dart';
import 'package:game_book_counter/src/external/datasource/player/player_character_datasource_hive.dart';
import 'package:game_book_counter/src/infra/player/datasource/player_character_datasource.dart';
import 'package:game_book_counter/src/infra/player/repository/player_character_repository_impl.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';

void serviceLocatorPlayer() {
  // DATASOURCE
  getIt.registerLazySingleton<PlayerCharacterDatasource>(() => PlayerCharacterDatasourceHive());
  // REPOSITORY
  getIt.registerLazySingleton<PlayerCharacterRepository>(() => PlayerCharacterRepositoryImpl(getIt()));
  // USE CASES
  getIt.registerLazySingleton<GetPlayer>(() => GetPlayer(getIt()));
  getIt.registerLazySingleton<AddPlayer>(() => AddPlayer(getIt()));
  getIt.registerLazySingleton<UpdatePlayer>(() => UpdatePlayer(getIt()));
  getIt.registerLazySingleton<PlayerSetLevel>(() => PlayerSetLevel());
  getIt.registerLazySingleton<PlayerSetExp>(() => PlayerSetExp());
  getIt.registerLazySingleton<AddPlayerSkill>(() => AddPlayerSkill());
  getIt.registerLazySingleton<RemovePlayerSkill>(() => RemovePlayerSkill());
  getIt.registerLazySingleton<AddPlayerSpell>(() => AddPlayerSpell());
  getIt.registerLazySingleton<RemovePlayerSpell>(() => RemovePlayerSpell());
  // BLOC
  getIt.registerSingleton<PlayerBloc>(PlayerBloc(
    getPlayer: getIt(),
    addPlayer: getIt(),
    updatePlayer: getIt(),
    playerSetLevel: getIt(),
    playerSetExp: getIt(),
    addPlayerSkill: getIt(),
    removePlayerSkill: getIt(),
    addPlayerSpell: getIt(),
    removePlayerSpell: getIt(),
  ));
}