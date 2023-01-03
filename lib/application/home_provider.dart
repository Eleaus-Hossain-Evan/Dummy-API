import 'package:dummy_api/application/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final HomeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState.init());
}
