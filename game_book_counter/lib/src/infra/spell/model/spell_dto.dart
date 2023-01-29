import 'package:game_book_counter/src/domain/spell/entity/spell.dart';
import 'package:game_book_counter/src/infra/item/model/item_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class SpellDto {
  String id;
  String name;
  String? description;
  int manaConsume;
  ItemDto? itemConsume;
  Function? effect;
  bool enabled;

  SpellDto({
    required this.id,
    required this.name,
    this.description,
    required this.manaConsume,
    this.itemConsume,
    required this.effect,
    this.enabled = true,
  });

  factory SpellDto.fromMap(Map<String, dynamic> map) => SpellDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        description: map[EntitiesConst.description] as String?,
        manaConsume: map[EntitiesConst.manaConsume] as int,
        itemConsume: map[EntitiesConst.itemConsume] != null ? ItemDto.fromMap(map[EntitiesConst.id] as Map<String, dynamic>) : null,
        effect: map[EntitiesConst.effect] as Function?,
        enabled: map[EntitiesConst.enabled] as bool,
      );

  factory SpellDto.fromEntity(Spell entity) => SpellDto(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        manaConsume: entity.manaConsume,
        itemConsume: entity.itemConsume != null ? ItemDto.fromEntity(entity.itemConsume!) : null,
        effect: entity.effect,
        enabled: entity.enabled,
      );

  Map<String, dynamic> toMap() => {
    EntitiesConst.id: id,
    EntitiesConst.name: name,
    EntitiesConst.description: description,
    EntitiesConst.manaConsume: manaConsume,
    EntitiesConst.itemConsume: itemConsume?.toMap(),
    EntitiesConst.effect: effect,
    EntitiesConst.enabled: enabled,
  };

  Spell toEntity() => Spell(
        id: id,
        name: name,
        description: description,
        manaConsume: manaConsume,
        itemConsume: itemConsume?.toEntity(),
        effect: effect,
        enabled: enabled,
      );
}