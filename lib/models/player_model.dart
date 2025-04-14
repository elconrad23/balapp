class Player {
  final String name;
  final String position;
  final int height;
  final int age;
  final String image;

  Player(
      {required this.name,
      required this.position,
      required this.age,
      required this.height,
      required this.image});

  Map toJson() {
    return {
      'name': name,
      'position': position,
      'height': height,
      'age': age,
      'image': image,
    };
  }
}
