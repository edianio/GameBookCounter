import 'package:game_book_counter/src/domain/item/entity/item.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ItemDto {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  int quantity;
  @HiveField(4)
  int buyPrice;
  @HiveField(5)
  int sellPrice;
  @HiveField(6)
  bool enabled;

  ItemDto({
    required this.id,
    required this.name,
    this.description,
    required this.quantity,
    required this.buyPrice,
    required this.sellPrice,
    required this.enabled,
  });

  factory ItemDto.fromMap(Map<String,dynamic> map) =>
      ItemDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        description: map[EntitiesConst.description] as String,
        quantity: map[EntitiesConst.quantity] as int,
        buyPrice: map[EntitiesConst.buyPrice] as int,
        sellPrice: map[EntitiesConst.sellPrice] as int,
        enabled: map[EntitiesConst.enabled] as bool,
      );

  factory ItemDto.fromEntity(Item entity) =>
      ItemDto(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        quantity: entity.quantity,
        buyPrice: entity.buyPrice,
        sellPrice: entity.sellPrice,
        enabled: entity.enabled,
      );

  Map<String,dynamic> toMap() => {
    EntitiesConst.id: id,
    EntitiesConst.name: name,
    EntitiesConst.description: description,
    EntitiesConst.quantity: quantity,
    EntitiesConst.buyPrice: buyPrice,
    EntitiesConst.sellPrice: sellPrice,
    EntitiesConst.enabled: enabled,
  };

  Item toEntity() =>
      Item(
        id: id,
        name: name,
        description: description,
        quantity: quantity,
        buyPrice: buyPrice,
        sellPrice: sellPrice,
        enabled: enabled,
      );
}