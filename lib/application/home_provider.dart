import 'package:dummy_api/application/home_state.dart';
import 'package:dummy_api/infustructure/home_repo.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier(HomeRepo(), ref);
});

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepo repo;
  final Ref ref;
  HomeNotifier(this.repo, this.ref) : super(HomeState.init());

  void getAllPosts() async {
    state = state.copyWith(loading: true);

    final result = await repo.fetchAllPostsFromCleanApi();

    Logger.i('result: $result');

    result.fold((l) {
      state = state.copyWith(loading: false, failure: l);
    }, (r) {
      state = state.copyWith(loading: false, posts: r.data);
    });
  }
}
