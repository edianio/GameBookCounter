import 'package:game_book_counter/src/domain/consumable/entity/consumable.dart';
import 'package:game_book_counter/src/infra/attributes/model/attributes_dto.dart';
import 'package:game_book_counter/src/infra/item/model/item_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ConsumableDto extends ItemDto {
  @HiveField(7)
  AttributesDto? attributes;
  @HiveField(8)
  Function? effect;
  @HiveField(9)
  int? timeEffectInSeconds;

  ConsumableDto({
    required super.id,
    required super.name,
    super.description,
    required super.buyPrice,
    required super.sellPrice,
    required super.quantity,
    required super.enabled,
    this.attributes,
    this.effect,
    this.timeEffectInSeconds,
  });

  factory ConsumableDto.fromMap(Map<String, dynamic> map) =>
      ConsumableDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        description: map[EntitiesConst.description] as String?,
        buyPrice: map[EntitiesConst.buyPrice] as int,
        sellPrice: map[EntitiesConst.sellPrice] as int,
        quantity: map[EntitiesConst.quantity] as int,
        enabled: map[EntitiesConst.enabled] as bool,
        attributes: AttributesDto.fromMap(map[EntitiesConst.attributes]),
        effect: map[EntitiesConst.effect] as Function?,
        timeEffectInSeconds: map[EntitiesConst.timeEffectInSeconds] as int?,
      );

  factory ConsumableDto.fromEntity(Consumable entity) =>
      ConsumableDto(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        buyPrice: entity.buyPrice,
        sellPrice: entity.sellPrice,
        quantity: entity.quantity,
        enabled: entity.enabled,
        attributes: entity.attributes != null ? AttributesDto.fromEntity(entity.attributes!) : null,
        effect: entity.effect,
        timeEffectInSeconds: entity.timeEffectInSeconds,
      );

  @override
  Map<String, dynamic> toMap() => {
    EntitiesConst.id: id,
    EntitiesConst.name: name,
    EntitiesConst.description: description,
    EntitiesConst.quantity: quantity,
    EntitiesConst.buyPrice: buyPrice,
    EntitiesConst.sellPrice: sellPrice,
    EntitiesConst.enabled: enabled,
    EntitiesConst.attributes: attributes?.toMap(),
    EntitiesConst.effect: effect,
    EntitiesConst.timeEffectInSeconds: timeEffectInSeconds,
  };

  @override
  Consumable toEntity() =>
      Consumable(
        id: id,
        name: name,
        description: description,
        quantity: quantity,
        buyPrice: buyPrice,
        sellPrice: sellPrice,
        attributes: attributes?.toEntity(),
        effect: effect,
        enabled: enabled,
        timeEffectInSeconds: timeEffectInSeconds,
      );
}