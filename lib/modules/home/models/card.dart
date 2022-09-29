import 'package:flutter/cupertino.dart';

@immutable
class Card {
  const Card({
    this.id,
    required this.name,
  });

  final String? id;

  final String name;
}
