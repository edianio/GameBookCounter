class Spell {
  final String id;
  String name;
  String? description;
  Function effect;

  Spell({
    required this.id,
    required this.name,
    this.description,
    required this.effect,
  });
}