import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';

class Skill {
  final int id;
  String name;
  String? description;
  Attributes? attributes;
  Function effect;

  Skill({required this.id, required this.name, this.description, this.attributes, required this.effect});
}
