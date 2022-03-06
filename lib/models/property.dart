import 'dart:convert';

import 'package:collection/collection.dart';

class Property {
  String propertyPrice;
  int propertyCapacity;
  String propertyImage;
  String propertyName;
  String propertyLocation;

  Property({
    required this.propertyPrice,
    required this.propertyCapacity,
    required this.propertyImage,
    required this.propertyName,
    required this.propertyLocation,
  });

  @override
  String toString() {
    return 'Property(propertyPrice: $propertyPrice, propertyCapacity: $propertyCapacity, propertyImage: $propertyImage, propertyName: $propertyName, propertyLocation: $propertyLocation)';
  }

  factory Property.fromMap(Map<String, dynamic> data) => Property(
        propertyPrice: data['propertyPrice'] as String,
        propertyCapacity: data['propertyCapacity'] as int,
        propertyImage: data['propertyImage'] as String,
        propertyName: data['propertyName'] as String,
        propertyLocation: data['propertyLocation'] as String,
      );

  Map<String, dynamic> toMap() => {
        'propertyPrice': propertyPrice,
        'propertyCapacity': propertyCapacity,
        'propertyImage': propertyImage,
        'propertyName': propertyName,
        'propertyLocation': propertyLocation,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Property].
  factory Property.fromJson(String data) {
    return Property.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Property] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Property) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      propertyPrice.hashCode ^
      propertyCapacity.hashCode ^
      propertyImage.hashCode ^
      propertyName.hashCode ^
      propertyLocation.hashCode;
}
