import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;

class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final String imgsource;
  final String planned;
  final String visited;

  Sight(
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type,
    this.imgsource,
    this.planned,
    this.visited,
  );
}
