import 'package:game_book_counter/src/domain/player/usecases/player_set_exp.dart';
import 'package:game_book_counter/src/domain/player/usecases/player_set_level.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/player/bloc/player_bloc.dart';

void serviceLocatorPlayer() {
  // USECASES
  getIt.registerLazySingleton<PlayerSetLevel>(() => PlayerSetLevel());
  getIt.registerLazySingleton<PlayerSetExp>(() => PlayerSetExp());
  // BLOC
  getIt.registerSingleton<PlayerBloc>(PlayerBloc(setLevel: getIt(), setExp: getIt()));
}