import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/job/entity/job.dart';
import 'package:game_book_counter/src/domain/magic/entity/spell.dart';
import 'package:game_book_counter/src/domain/skill/entity/skill.dart';

class PlayerCharacter {
  final String id;
  final String name;
  String? alias;
  String? description;
  int level;
  int exp;
  final Job? job;
  final Attributes attributes;
  final List<Skill> skills;
  final List<Spell> spells;
  final Inventory inventory;

  PlayerCharacter({
    required this.id,
    required this.name,
    this.alias,
    this.description,
    this.level = 1,
    this.exp = 0,
    this.job,
    required this.attributes,
    required this.skills,
    required this.spells,
    required this.inventory,
  });
}