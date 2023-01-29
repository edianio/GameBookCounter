import 'package:game_book_counter/src/domain/item/repository/item_repository.dart';
import 'package:game_book_counter/src/domain/item/use_cases/add_item.dart';
import 'package:game_book_counter/src/domain/item/use_cases/get_all_items.dart';
import 'package:game_book_counter/src/domain/item/use_cases/set_enabled_item.dart';
import 'package:game_book_counter/src/external/datasource/item/item_datasource_hive.dart';
import 'package:game_book_counter/src/infra/item/datasource/item_datasource.dart';
import 'package:game_book_counter/src/infra/item/repository/item_repository_impl.dart';
import 'package:game_book_counter/src/modules/service_locator_setup.dart';
import 'package:game_book_counter/src/presentation/items/bloc/items_bloc.dart';

void serviceLocatorItems() {
  // DATASOURCE
  getIt.registerLazySingleton<ItemDatasource>(() => ItemDatasourceHive());
  // REPOSITORY
  getIt.registerLazySingleton<ItemRepository>(() => ItemRepositoryImpl(getIt()));
  // USE CASES
  getIt.registerLazySingleton<AddItem>(() => AddItem(getIt()));
  getIt.registerLazySingleton<GetAllItems>(() => GetAllItems(getIt()));
  getIt.registerLazySingleton<SetEnabledItem>(() => SetEnabledItem(getIt()));
  // BLOC
  getIt.registerSingleton<ItemsBloc>(ItemsBloc(addItem: getIt(), getAll: getIt()));
}