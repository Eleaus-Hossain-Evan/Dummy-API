import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'owner.dart';

class PostModel extends Equatable {
  String id;
  String image;
  int likes;
  List<String> tags;
  String text;
  DateTime publishDate;
  DateTime updatedDate;
  Owner owner;

  PostModel({
    required this.id,
    required this.image,
    required this.likes,
    required this.tags,
    required this.text,
    required this.publishDate,
    required this.updatedDate,
    required this.owner,
  });

  factory PostModel.init() => PostModel(
        id: "",
        image: "",
        likes: 0,
        tags: const [],
        text: "",
        publishDate: DateTime.now(),
        updatedDate: DateTime.now(),
        owner: Owner.init(),
      );

  PostModel copyWith({
    String? id,
    String? image,
    int? likes,
    List<String>? tags,
    String? text,
    DateTime? publishDate,
    DateTime? updatedDate,
    Owner? owner,
  }) {
    return PostModel(
      id: id ?? this.id,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      tags: tags ?? this.tags,
      text: text ?? this.text,
      publishDate: publishDate ?? this.publishDate,
      updatedDate: updatedDate ?? this.updatedDate,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'likes': likes,
      'tags': tags,
      'text': text,
      'publishDate': publishDate.toIso8601String(),
      'updatedDate': updatedDate.toIso8601String(),
      'owner': owner.toMap(),
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      image: map['image'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      tags: List<String>.from(map['tags'] ?? const []),
      text: map['text'] ?? '',
      publishDate: map['publishDate'] == null
          ? DateTime.now()
          : DateTime.tryParse(map['publishDate']) ?? DateTime.now(),
      updatedDate: map['updatedDate'] == null
          ? DateTime.now()
          : DateTime.tryParse(map['updatedDate']) ?? DateTime.now(),
      owner: Owner.fromMap(map['owner']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostModel(id: $id, image: $image, likes: $likes, tags: $tags, text: $text, publishDate: $publishDate, updatedDate: $updatedDate, owner: $owner)';
  }

  @override
  List<Object> get props {
    return [
      id,
      image,
      likes,
      tags,
      text,
      publishDate,
      updatedDate,
      owner,
    ];
  }
}
