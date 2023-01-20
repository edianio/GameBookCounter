import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/main/app_const.dart';

class AttributesDto {
  int life;
  int mana;
  int attack;
  int defense;
  int luck;
  int speed;
  int intelligence;

  AttributesDto({
    this.life = 0,
    this.mana = 0,
    this.attack = 0,
    this.defense = 0,
    this.luck = 0,
    this.speed = 0,
    this.intelligence = 0,
  });

  factory AttributesDto.fromEntity(Attributes entity) => AttributesDto(
    life: entity.life,
    mana: entity.mana,
    attack: entity.attack,
    defense: entity.defense,
    luck: entity.luck,
    speed: entity.speed,
    intelligence: entity.intelligence,
  );

  factory AttributesDto.fromMap(Map<String, dynamic> map) => AttributesDto(
    life: map[EntitiesConst.life] as int,
    mana: map[EntitiesConst.mana] as int,
    attack: map[EntitiesConst.attack] as int,
    defense: map[EntitiesConst.defense] as int,
    luck: map[EntitiesConst.luck] as int,
    speed: map[EntitiesConst.speed] as int,
    intelligence: map[EntitiesConst.intelligence] as int,
  );

  Map<String, dynamic> toMap() => {
    EntitiesConst.life: life,
    EntitiesConst.mana: mana,
    EntitiesConst.attack: attack,
    EntitiesConst.defense: defense,
    EntitiesConst.luck: luck,
    EntitiesConst.speed: speed,
    EntitiesConst.intelligence: intelligence,
  };

  Attributes toEntity() =>
      Attributes(
        life: life,
        mana: mana,
        attack: attack,
        defense: defense,
        luck: luck,
        speed: speed,
        intelligence: intelligence,
      );
}