import 'package:game_book_counter/src/domain/attributes/entity/attributes.dart';

class Enemy {
  final int id;
  String? name;
  final Attributes attributes;

  Enemy({required this.id, this.name, required this.attributes,});

}