import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';

class Skill {
  final String id;
  String name;
  String? description;
  Attributes? attributes;
  Function? effect;
  bool enabled;

  Skill({
    required this.id,
    required this.name,
    this.description,
    this.attributes,
    this.effect,
    this.enabled = true,
  });
}
