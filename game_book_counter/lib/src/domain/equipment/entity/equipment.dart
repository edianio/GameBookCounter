import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';

enum EquipmentPosition {
  head,
  body,
  hands,
  legs,
  foots,
  accessory1,
  accessory2;
}

class Equipment extends Item{
  Attributes attributes;
  Function? effect;
  EquipmentPosition position;

  Equipment({
    required super.id,
    required super.name,
    super.description,
    super.buyPrice,
    super.sellPrice,
    required this.attributes,
    required this.position,
    this.effect,
  });
}