import 'package:dummy_api/domain/post_response.dart';
import 'package:dummy_api/utils/api_routes.dart';
import 'package:dummy_api/utils/network_util/network_handler.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

class HomeRepo {
  final api = NetworkHandler.instance;
  Future<Either<CleanFailure, PostResponse>> fetchAllPostsFromCleanApi() async {
    final result = await api.get(
      endPoint: APIRoute.post,
      fromData: (data) => PostResponse.fromMap(data),
      withToken: true,
    );

    Logger.i('result: $result');

    return result;
  }
}
