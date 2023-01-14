class Item {
  final int id;
  String name;
  String? description;
  int buyPrice;
  int sellPrice;

  Item({
    required this.id,
    required this.name,
    this.description,
    this.buyPrice = 1,
    this.sellPrice = 1,
  });
}