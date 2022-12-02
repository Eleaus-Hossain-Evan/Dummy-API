import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'post_model.dart';

class PostResponse extends Equatable {
  List<PostModel> data;
  int total;
  int page;
  int limit;

  PostResponse({
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory PostResponse.init() =>
      PostResponse(data: const [], total: 0, page: 0, limit: 0);

  PostResponse copyWith({
    List<PostModel>? data,
    int? total,
    int? page,
    int? limit,
  }) {
    return PostResponse(
      data: data ?? this.data,
      total: total ?? this.total,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'total': total,
      'page': page,
      'limit': limit,
    };
  }

  factory PostResponse.fromMap(Map<String, dynamic> map) {
    return PostResponse(
      data: List<PostModel>.from(
          map['data']?.map((x) => PostModel.fromMap(x)) ?? const []),
      total: map['total']?.toInt() ?? 0,
      page: map['page']?.toInt() ?? 0,
      limit: map['limit']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostResponse.fromJson(String source) =>
      PostResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostResponse(data: $data, total: $total, page: $page, limit: $limit)';
  }

  @override
  List<Object> get props => [data, total, page, limit];
}
