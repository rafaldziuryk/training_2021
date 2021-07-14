import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 1)
class Pokemon {
  Pokemon(this.name, this.id, this.image);

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String image;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    final name = json['name'];
    final url = Uri.parse(json['url']);
    final id = url.pathSegments.lastWhere((element) => element.isNotEmpty);
    final photo =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
    return Pokemon(name, id, photo);
  }
}
