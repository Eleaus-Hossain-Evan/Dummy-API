import 'package:dummy_api/models/post_model.dart';
import 'package:dummy_api/servies/remote_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var postList = [].obs;
  PostModel? postModel;

  @override
  void onInit() async {
    getAllPosts();
    super.onInit();
  }

  void getAllPosts() async {
    try {
      isLoading(true);
      var posts = await RemoteService.fetchAllPosts();
      if (posts != null) {
        postModel = posts;
        postList.value = posts.data;
        print("Controller...... ${postList.length}");
      }
    } finally {
      isLoading(false);
    }
  }
}
