class HomeRepo {
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

    // isLoading(true);

    // final result = await service.fetchAllPostsFromCleanApi();

    // Logger.i('result: $result');

    // result.fold((l) {
    //   isLoading(false);
    //   Logger.e('error: $l');
    // }, (r) {
    //   isLoading(false);
    //   postList(r.data);
    //   Logger.d("Controller...... ${postList.length}");
    // });
  }
}
