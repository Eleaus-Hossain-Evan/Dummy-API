import 'package:clean_api/clean_api.dart';
import 'package:dummy_api/data/network/api.dart';
import 'package:dummy_api/data/models/post_model.dart';
import 'package:dummy_api/data/network/api_handlers.dart';
import 'package:dummy_api/data/network/network_handlers.dart';
import 'package:http/http.dart' as http;

import '../models/post_response.dart';

class RemoteService {
  // static Future<PostList> getAllUser() async {
  //   try {
  //     var response = await client.get(
  //         Uri.parse("${KStrings.baseUrl}user?limit=10"),
  //         headers: {"app-id": KStrings.appId});
  //     print("resopnse...........${response}");
  //     if (response.statusCode == 200) {
  //       String jsonString = response.body;
  //       print("jsonString.................${jsonString}");
  //       return postListFromJson(jsonString);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       return postListFromJson('');
  //     }
  //   } finally {
  //     client.close();
  //   }
  // }

  // static Future<PostModel?> fetchAllPosts() async {
  //   try {
  //     var response = await client.get(Uri.parse("${API.baseUrl}post?limit=10"),
  //         headers: {"app-id": API.appId});
  //     print("resopnse...........${response}");
  //     if (response.statusCode == 200) {
  //       var jsonString = response.body;
  //       print("jsonString.................${jsonString}");
  //       return postListFromJson(jsonString);
  //     } else {
  //       print('Request failed with status: ${response.statusCode}.');
  //       return postListFromJson('');
  //     }
  //   } catch (e) {
  //     print("Exception......$e");
  //     postListFromJson(e.toString());
  //   } finally {
  //     client.close();
  //   }
  // }

  static Future<PostResponse?> fetchAllPosts() async {
    try {
      var responseBody = await Network.handleResponse(await Network.getRequest(
        API.post,
        queryParams: API.homePostQuery,
        mapHeaders: API.appIdHeaders,
      ));
      return PostResponse.fromJson(responseBody);
    } on Exception catch (e) {
      print(e);
    }
  }

  final api = CleanApi.instance;
  final myApi = ApiHandlers.instance;

  Future<Either<CleanFailure, PostResponse>> fetchAllPostsFromCleanApi() async {
    final data = await myApi.get<PostResponse>(
      fromData: (data) => PostResponse.fromMap(data),
      endPoint: API.post,
      withToken: true,
    );
    return data.fold((l) => left(l), (r) => right(r));
  }
}
