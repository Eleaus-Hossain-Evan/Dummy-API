import 'package:dummy_api/constant/k_strings.dart';
import 'package:dummy_api/models/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static var client = http.Client();

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

  static Future<PostModel?> fetchAllPosts() async {
    try {
      var response = await client.get(
          Uri.parse("${KStrings.baseUrl}post?limit=10"),
          headers: {"app-id": KStrings.appId});
      print("resopnse...........${response}");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        print("jsonString.................${jsonString}");
        return postListFromJson(jsonString);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return postListFromJson('');
      }
    } catch (e) {
      print("Exception......$e");
      postListFromJson(e.toString());
    } finally {
      client.close();
    }
  }
}
