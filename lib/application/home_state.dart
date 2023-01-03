import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final bool loading;

  const HomeState({
    required this.loading,
  });

  factory HomeState.init() => HomeState(
        loading: false,
      );

  HomeState copyWith({
    bool? loading,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'loading': loading,
    };
  }

  factory HomeState.fromMap(Map<String, dynamic> map) {
    return HomeState(
      loading: map['loading'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeState.fromJson(String source) =>
      HomeState.fromMap(json.decode(source));

  @override
  String toString() => 'HomeState(loading: $loading)';

  @override
  List<Object> get props => [loading];
}
