class Item {
  final String id;
  String name;
  String? description;
  int buyPrice;
  int sellPrice;

  Item({
    required this.id,
    required this.name,
    this.description,
    this.buyPrice = 0,
    this.sellPrice = 0,
  });
}