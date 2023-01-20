import 'package:game_book_counter/src/domain/skill/entity/skill.dart';
import 'package:game_book_counter/src/infra/attributes/model/attributes_dto.dart';
import 'package:game_book_counter/src/main/app_const.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class SkillDto {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  AttributesDto? attributes;
  @HiveField(4)
  Function? effect;
  @HiveField(5)
  bool enabled;

  SkillDto({required this.id, required this.name, this.description, this.attributes, required this.effect, required this.enabled});

  factory SkillDto.fromEntity(Skill entity) =>
      SkillDto(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        attributes: entity.attributes != null ? AttributesDto.fromEntity(entity.attributes!) : null,
        effect: entity.effect,
        enabled: entity.enabled,
      );

  factory SkillDto.fromMap(Map<String, dynamic> map) =>
      SkillDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        description: map[EntitiesConst.description] as String?,
        attributes: map[EntitiesConst.attributes] != null ? AttributesDto.fromMap(map[EntitiesConst.attributes] as Map<String, dynamic>) : null,
        effect: map[EntitiesConst.effect] as Function?,
        enabled: map[EntitiesConst.enabled] as bool,
      );

  Map<String, dynamic> toMap() => {
    EntitiesConst.id: id,
    EntitiesConst.name: name,
    EntitiesConst.description: description,
    EntitiesConst.attributes: attributes?.toMap(),
    EntitiesConst.effect: effect,
    EntitiesConst.enabled: enabled,
  };

  Skill toEntity() =>
      Skill(
        id: id,
        name: name,
        description: description,
        attributes: attributes?.toEntity(),
        effect: effect,
        enabled: enabled,
      );
}