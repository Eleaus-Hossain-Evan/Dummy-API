import 'package:equatable/equatable.dart';

import 'package:dummy_api/utils/network_util/network_failure.dart';

import '../domain/post_model.dart';

class HomeState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<PostModel> posts;

  const HomeState({
    required this.loading,
    required this.failure,
    required this.posts,
  });

  factory HomeState.init() => HomeState(
        loading: false,
        failure: CleanFailure.none(),
        posts: const [],
      );

  HomeState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<PostModel>? posts,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      posts: posts ?? this.posts,
    );
  }

  @override
  String toString() =>
      'HomeState(loading: $loading, failure: $failure, posts: $posts)';

  @override
  List<Object> get props => [loading, failure, posts];
}
