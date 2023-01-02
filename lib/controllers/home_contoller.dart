import 'package:clean_api/clean_api.dart';
import 'package:dummy_api/data/models/post_model.dart';
import 'package:dummy_api/service/remote_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final isLoading = true.obs;
  final postModel = PostModel.init().obs;
  final postList = <PostModel>[].obs;

  final service = RemoteService();

  @override
  void onInit() async {
    getAllPosts();
    super.onInit();
  }

  void getAllPosts() async {
    // try {
    //   isLoading(true);
    //   var posts = await RemoteService.fetchAllPosts();
    //   if (posts != null) {
    //     postList(posts.data);
    //     postList.value = posts.data;
    //     print("Controller...... ${postList.length}");
    //   }
    // } finally {
    //   isLoading(false);
    // }

    isLoading(true);

    final result = await service.fetchAllPostsFromCleanApi();

    Logger.i('result: $result');

    result.fold((l) {
      isLoading(false);
      Logger.e('error: $l');
    }, (r) {
      isLoading(false);
      postList(r.data);
      Logger.d("Controller...... ${postList.length}");
    });
  }
}
