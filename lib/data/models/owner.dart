import 'dart:convert';

import 'package:equatable/equatable.dart';

class Owner extends Equatable {
  String id;
  String title;
  String firstName;
  String lastName;
  String picture;

  Owner({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  factory Owner.init() => Owner(
        id: "",
        title: "",
        firstName: "",
        lastName: "",
        picture: "",
      );

  Owner copyWith({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
  }) {
    return Owner(
      id: id ?? this.id,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
    };
  }

  factory Owner.fromMap(Map<String, dynamic> map) {
    return Owner(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Owner.fromJson(String source) => Owner.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Owner(id: $id, title: $title, firstName: $firstName, lastName: $lastName, picture: $picture)';
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      firstName,
      lastName,
      picture,
    ];
  }
}
