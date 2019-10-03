import 'package:flutter/material.dart';

class Repos {
  final int id;
  final String name;
  final String description;
  final String url;
  final String language;

  Repos(
      {@required this.id,
        @required this.name,
        @required this.description,
        @required this.url,
        @required this.language});
}
