import 'package:game_book_counter/src/modules/service_locator_inventory.dart';
import 'package:game_book_counter/src/modules/service_locator_items.dart';
import 'package:game_book_counter/src/modules/service_locator_pages.dart';
import 'package:game_book_counter/src/modules/service_locator_player.dart';
import 'package:game_book_counter/src/modules/service_locator_skills.dart';
import 'package:game_book_counter/src/modules/service_locator_spells.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void serviceLocatorSetup() {
  serviceLocatorPages();
  serviceLocatorPlayer();
  serviceLocatorSkills();
  serviceLocatorItems();
  serviceLocatorSpells();
  serviceLocatorInventory();
}