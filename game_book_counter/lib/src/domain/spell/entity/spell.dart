import 'package:game_book_counter/src/domain/item/entity/item.dart';

class Spell {
  final String id;
  String name;
  String? description;
  int manaConsume;
  Item? itemConsume;
  Function effect;

  Spell({
    required this.id,
    required this.name,
    this.description,
    this.manaConsume = 0,
    this.itemConsume,
    required this.effect,
  });
}