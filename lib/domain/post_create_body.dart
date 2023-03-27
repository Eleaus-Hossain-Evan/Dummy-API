import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostCreateBody extends Equatable {
  final String text;
  final String image;
  final int likes;
  final List<String> tags;
  final String owner;

  const PostCreateBody({
    required this.text,
    required this.image,
    required this.likes,
    required this.tags,
    required this.owner,
  });

  factory PostCreateBody.init() => const PostCreateBody(
        text: '',
        image: '',
        likes: 0,
        tags: [],
        owner: '',
      );

  PostCreateBody copyWith({
    String? text,
    String? image,
    int? likes,
    List<String>? tags,
    String? owner,
  }) {
    return PostCreateBody(
      text: text ?? this.text,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      tags: tags ?? this.tags,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'image': image,
      'likes': likes,
      'tags': tags,
      'owner': owner,
    };
  }

  factory PostCreateBody.fromMap(Map<String, dynamic> map) {
    return PostCreateBody(
      text: map['text'] ?? '',
      image: map['image'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      tags: List<String>.from(map['tags'] ?? const []),
      owner: map['owner'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostCreateBody.fromJson(String source) =>
      PostCreateBody.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostCreateBody(text: $text, image: $image, likes: $likes, tags: $tags, owner: $owner)';
  }

  @override
  List<Object> get props {
    return [
      text,
      image,
      likes,
      tags,
      owner,
    ];
  }
}
