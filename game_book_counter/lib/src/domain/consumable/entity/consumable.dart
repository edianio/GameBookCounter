import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/item/entity/item.dart';

class Consumable extends Item{
  Attributes? attributes;
  Function? effect;
  int? timeEffectInSeconds;

  Consumable({
    required super.id,
    required super.name,
    super.description,
    super.buyPrice,
    super.sellPrice,
    super.quantity,
    super.enabled,
    this.attributes,
    this.effect,
    this.timeEffectInSeconds,
  });
}