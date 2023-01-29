import 'package:game_book_counter/src/domain/job/entity/job.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class JobDto {
  String id;
  String name;
  String? description;
  int level;
  int exp;

  JobDto({
    required this.id,
    required this.name,
    this.description,
    required this.level,
    required this.exp,
  });

  factory JobDto.fromMap(Map<String, dynamic> map) => JobDto(
        id: map[EntitiesConst.id] as String,
        name: map[EntitiesConst.name] as String,
        description: map[EntitiesConst.description] as String?,
        level: map[EntitiesConst.level] as int,
        exp: map[EntitiesConst.exp] as int,
      );

  factory JobDto.fromEntity(Job entity) => JobDto(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        level: entity.level,
        exp: entity.exp,
      );

  Map<String, dynamic> toMap() => {
    EntitiesConst.id: id,
    EntitiesConst.name: name,
    EntitiesConst.description: description,
    EntitiesConst.level: level,
    EntitiesConst.exp: exp,
  };

  Job toEntity() => Job(
        id: id,
        name: name,
        description: description,
        level: level,
        exp: exp,
      );
}