class Pokemon {
  Pokemon(this.name, this.id, this.image);

  final String name;
  final String id;
  final String image;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    final name = json['name'];
    final url = Uri.parse(json['url']);
    final id = url.pathSegments.lastWhere((element) => element.isNotEmpty);
    final photo = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    return Pokemon(name, id, photo);
  }
}