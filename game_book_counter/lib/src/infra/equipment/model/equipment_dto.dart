import 'package:game_book_counter/src/domain/equipment/entity/equipment.dart';
import 'package:game_book_counter/src/infra/attributes/model/attributes_dto.dart';
import 'package:game_book_counter/src/infra/item/model/item_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class EquipmentDto extends ItemDto {
  @HiveField(7)
  AttributesDto attributes;
  @HiveField(8)
  Function? effect;
  @HiveField(9)
  EquipmentPosition position;
  @HiveField(10)
  bool equipped;

  EquipmentDto({
    required super.id,
    required super.name,
    super.description,
    required super.buyPrice,
    required super.sellPrice,
    required super.quantity,
    required super.enabled,
    required this.attributes,
    required this.position,
    this.effect,
    required this.equipped,
  });

  factory EquipmentDto.fromMap(Map<String, dynamic> map) =>
      EquipmentDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        description: map[EntitiesConst.description] as String?,
        buyPrice: map[EntitiesConst.buyPrice] as int,
        sellPrice: map[EntitiesConst.sellPrice] as int,
        quantity: map[EntitiesConst.quantity] as int,
        enabled: map[EntitiesConst.enabled] as bool,
        attributes: AttributesDto.fromMap(map[EntitiesConst.attributes]),
        position: map[EntitiesConst.position] as EquipmentPosition,
        effect: map[EntitiesConst.effect] as Function?,
        equipped: map[EntitiesConst.equipped] as bool,
      );

  factory EquipmentDto.fromEntity(Equipment entity) =>
      EquipmentDto(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        buyPrice: entity.buyPrice,
        sellPrice: entity.sellPrice,
        quantity: entity.quantity,
        enabled: entity.enabled,
        attributes: AttributesDto.fromEntity(entity.attributes),
        position: entity.position,
        equipped: entity.equipped,
        effect: entity.effect,
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
    EntitiesConst.attributes: attributes.toMap(),
    EntitiesConst.position: position.index,
    EntitiesConst.effect: effect,
    EntitiesConst.equipped: equipped,
  };

  @override
  Equipment toEntity() =>
      Equipment(
        id: id,
        name: name,
        description: description,
        quantity: quantity,
        buyPrice: buyPrice,
        sellPrice: sellPrice,
        attributes: attributes.toEntity(),
        position: position,
        equipped: equipped,
        effect: effect,
        enabled: enabled,
      );
}