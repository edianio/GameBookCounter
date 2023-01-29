import 'package:game_book_counter/src/domain/inventory/repository/inventory_repository.dart';
import 'package:game_book_counter/src/domain/inventory/use_cases/get_inventory.dart';
import 'package:game_book_counter/src/external/datasource/inventory/inventory_datasource_hive.dart';
import 'package:game_book_counter/src/infra/inventory/datasource/inventory_datasource.dart';
import 'package:game_book_counter/src/infra/inventory/repository/inventory_repository_impl.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/inventory/bloc/inventory_bloc.dart';

void serviceLocatorInventory() {
  // DATASOURCE
  getIt.registerLazySingleton<InventoryDatasource>(() => InventoryDatasourceHive());
  // REPOSITORY
  getIt.registerLazySingleton<InventoryRepository>(() => InventoryRepositoryImpl(getIt()));
  // USE CASES
  getIt.registerLazySingleton<GetInventory>(() => GetInventory(getIt()));
  // BLOC
  getIt.registerSingleton<InventoryBloc>(InventoryBloc(getInventory: getIt()));
}