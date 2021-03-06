import 'dart:convert';

import 'package:collection/collection.dart';

class Service {
  int? id;
  List<String> city;
  String? imageUrl;
  String? title;
  String? description;

  Service(
      {this.id,
      required this.city,
      required this.imageUrl,
      required this.title,
      required this.description});

  @override
  String toString() {
    return 'Service(id: $id, city: $city, imageUrl: $imageUrl, title: $title)';
  }

  factory Service.fromMap(Map<String, dynamic> data) => Service(
        city: data['city'] as List<String>,
        imageUrl: data['imageURL'] as String,
        title: data['title'] as String,
        description: data['description'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'city': city,
        'imageUrl': imageUrl,
        'title': title,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Service].
  factory Service.fromJson(String data) {
    return Service.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Service] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Service) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => city.hashCode ^ imageUrl.hashCode ^ title.hashCode;
}
