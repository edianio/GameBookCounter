import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/main/app_const.dart';

enum EquipmentPosition {
  head(AppText.head),
  body(AppText.body),
  hands(AppText.hands),
  legs(AppText.legs),
  foots(AppText.foots),
  firstAccessory('${AppText.first} ${AppText.accessory}'),
  secondAccessory('${AppText.second} ${AppText.accessory}');

  final String name;

  const EquipmentPosition(this.name);
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