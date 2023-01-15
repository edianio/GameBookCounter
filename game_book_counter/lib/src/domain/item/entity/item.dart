class Item {
  final String id;
  String name;
  String? description;
  int quantity;
  int buyPrice;
  int sellPrice;

  Item({
    required this.id,
    required this.name,
    this.description,
    this.quantity = 1,
    this.buyPrice = 0,
    this.sellPrice = 0,
  });
}