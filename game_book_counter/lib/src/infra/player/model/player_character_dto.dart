import 'package:game_book_counter/src/domain/player/entity/player_character.dart';
import 'package:game_book_counter/src/infra/attributes/model/attributes_dto.dart';
import 'package:game_book_counter/src/infra/equipment/model/equipment_dto.dart';
import 'package:game_book_counter/src/infra/inventory/model/inventory_dto.dart';
import 'package:game_book_counter/src/infra/job/model/job_dto.dart';
import 'package:game_book_counter/src/infra/skill/model/skill_dto.dart';
import 'package:game_book_counter/src/infra/spell/model/spell_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class PlayerCharacterDto {
  String id;
  String name;
  String? alias;
  String? description;
  int level;
  int exp;
  JobDto? job;
  AttributesDto attributes;
  List<SkillDto> skills;
  List<SpellDto> spells;
  List<EquipmentDto> equipments;
  InventoryDto inventory;

  PlayerCharacterDto({
    required this.id,
    required this.name,
    this.alias,
    this.description,
    required this.level,
    required this.exp,
    this.job,
    required this.attributes,
    required this.skills,
    required this.spells,
    required this.equipments,
    required this.inventory,
  });

  factory PlayerCharacterDto.fromMap(Map<String, dynamic> map) => PlayerCharacterDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        alias: map[EntitiesConst.alias] as String?,
        description: map[EntitiesConst.description] as String?,
        level: map[EntitiesConst.level] as int,
        exp: map[EntitiesConst.exp] as int,
        job: map[EntitiesConst.job] as JobDto?,
        attributes: AttributesDto.fromMap(map[EntitiesConst.attributes]),
        skills: List.from(map[EntitiesConst.skills]).map((e) => SkillDto.fromMap(e as Map<String,dynamic>)).toList(),
        spells: List.from(map[EntitiesConst.spells]).map((e) => SpellDto.fromMap(e as Map<String,dynamic>)).toList(),
        equipments: List.from(map[EntitiesConst.equipments]).map((e) => EquipmentDto.fromMap(e as Map<String,dynamic>)).toList(),
        inventory: InventoryDto.fromMap(map[EntitiesConst.inventory]),
      );

  factory PlayerCharacterDto.fromEntity(PlayerCharacter entity) => PlayerCharacterDto(
        id: entity.id,
        name: entity.name,
        alias: entity.alias,
        description: entity.description,
        level: entity.level,
        exp: entity.exp,
        job: entity.job != null ? JobDto.fromEntity(entity.job!) : null,
        attributes: AttributesDto.fromEntity(entity.attributes),
        skills: entity.skills.map((e) => SkillDto.fromEntity(e)).toList(),
        spells: entity.spells.map((e) => SpellDto.fromEntity(e)).toList(),
        equipments: entity.equipments.map((e) => EquipmentDto.fromEntity(e)).toList(),
        inventory: InventoryDto.fromEntity(entity.inventory),
      );

  Map<String, dynamic> toMap() => {
    EntitiesConst.id: id,
    EntitiesConst.name: name,
    EntitiesConst.alias: alias,
    EntitiesConst.description: description,
    EntitiesConst.level: level,
    EntitiesConst.exp: exp,
    EntitiesConst.job: job?.toMap(),
    EntitiesConst.attributes: attributes.toMap(),
    EntitiesConst.skills: skills.map((e) => e.toMap()).toList(),
    EntitiesConst.spells: spells.map((e) => e.toMap()).toList(),
    EntitiesConst.equipments: equipments.map((e) => e.toMap()).toList(),
    EntitiesConst.inventory: inventory.toMap(),
  };

  PlayerCharacter toEntity() =>
      PlayerCharacter(
        id: id,
        name: name,
        alias: alias,
        description: description,
        level: level,
        exp: exp,
        job: job?.toEntity(),
        attributes: attributes.toEntity(),
        skills: skills.map((e) => e.toEntity()).toList(),
        spells: spells.map((e) => e.toEntity()).toList(),
        equipments: equipments.map((e) => e.toEntity()).toList(),
        inventory: inventory.toEntity(),
      );
}