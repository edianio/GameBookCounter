import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/infra/consumable/model/consumable_dto.dart';
import 'package:game_book_counter/src/infra/equipment/model/equipment_dto.dart';
import 'package:game_book_counter/src/infra/item/model/item_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class InventoryDto {
  @HiveField(0)
  String playerId;
  @HiveField(1)
  int money;
  @HiveField(2)
  List<ItemDto> items;
  @HiveField(3)
  List<EquipmentDto> equipments;
  @HiveField(4)
  List<ConsumableDto> consumables;

  InventoryDto({
    required this.playerId,
    required this.money,
    required this.items,
    required this.equipments,
    required this.consumables,
  });

  factory InventoryDto.fromMap(Map<String, dynamic> map) => InventoryDto(
        playerId: map[EntitiesConst.playerId] as String,
        money: map[EntitiesConst.money] as int,
        items: List.of(map[EntitiesConst.items]).map((e) => ItemDto.fromMap(e as Map<String, dynamic>)).toList(),
        equipments: List.of(map[EntitiesConst.equipments]).map((e) => EquipmentDto.fromMap(e as Map<String, dynamic>)).toList(),
        consumables: List.of(map[EntitiesConst.consumables]).map((e) => ConsumableDto.fromMap(e as Map<String, dynamic>)).toList(),
      );

  factory InventoryDto.fromEntity(Inventory entity) => InventoryDto(
        playerId: entity.playerId,
        money: entity.money,
        items: entity.items.map((e) => ItemDto.fromEntity(e)).toList(),
        equipments: entity.equipments.map((e) => EquipmentDto.fromEntity(e)).toList(),
        consumables: entity.consumables.map((e) => ConsumableDto.fromEntity(e)).toList(),
      );

  Map<String, dynamic> toMap() => {
    EntitiesConst.playerId: playerId,
    EntitiesConst.money: money,
    EntitiesConst.items: items.map((e) => e.toMap()).toList(),
    EntitiesConst.equipments: equipments.map((e) => e.toMap()).toList(),
    EntitiesConst.consumables: consumables.map((e) => e.toMap()).toList(),
  };

  Inventory toEntity() => Inventory(
        playerId: playerId,
        money: money,
        items: items.map((e) => e.toEntity()).toList(),
        equipments: equipments.map((e) => e.toEntity()).toList(),
        consumables: consumables.map((e) => e.toEntity()).toList(),
      );
}