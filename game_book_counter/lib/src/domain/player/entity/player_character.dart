import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';
import 'package:game_book_counter/src/domain/inventory/entity/inventory.dart';
import 'package:game_book_counter/src/domain/job/entity/job.dart';

class PlayerCharacter {
  final int id;
  final String name;
  String? alias;
  String? description;
  int level;
  int exp;
  final Job? job;
  final Attributes attributes;
  final List<String> skills;
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
    required this.inventory,
  });
}