import 'dart:convert';

import 'package:game_book_counter/src/infra/item/datasource/item_datasource.dart';
import 'package:game_book_counter/src/infra/item/model/item_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive_flutter/adapters.dart';

class ItemDatasourceHive implements ItemDatasource {
  @override
  Future<void> addItem(ItemDto item) async {
    final box = await Hive.openBox(DbConst.items);
    await box.put(item.id, item.toMap());
  }

  @override
  Future<List> getAllItems() async {
    final box = await Hive.openBox(DbConst.items);
    return box.values.cast().map((e) => json.decode(json.encode(e)) as Map<String,dynamic>).toList();
  }

  @override
  Future<void> setEnabledItem(ItemDto item) async {
    final box = await Hive.openBox(DbConst.items);
    await box.put(item.id, item.toMap());
  }
}