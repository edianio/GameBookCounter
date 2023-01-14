class Job {
  final int id;
  String name;
  String? description;
  int level;
  int exp;

  Job({
    required this.id,
    required this.name,
    this.description,
    this.level = 1,
    this.exp = 0,
  });
}