class Item {
  final String name;
  final int unitPrice;
  final String image;
  late final int quantity ;

  Item({required this.name, required this.unitPrice, required this.image, required this.quantity});

  Map toJson() {
    return {
      'name': name,
      'unit_price': unitPrice,
      'image': image,
      'quantity': quantity,
    };
  }
}