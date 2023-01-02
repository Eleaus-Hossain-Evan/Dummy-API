// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:clean_api/clean_api.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

import 'api.dart';

class ApiHandlers {
  ApiHandlers._();

  static final ApiHandlers instance = ApiHandlers._();

  Map<String, String>? _token;
  late String _baseUrl;
  late bool _enableDialogue;
  late bool _showLogs;
  Box? _cacheBox;
  late Client client;

  void enableCache(Box box) => _cacheBox = box;

  void setup(
      {required String baseUrl,
      bool showLogs = false,
      bool enableDialogue = true}) {
    client = Client();
    _baseUrl = baseUrl;
    _showLogs = showLogs;
    _enableDialogue = enableDialogue;
  }

  void setToken(Map<String, String> token) => _token = token;

  Map<String, String> header(bool withToken) {
    if (withToken) {
      return {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Accept': 'application/json',
        if (_token != null) ..._token!
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Accept': 'application/json',
      };
    }
  }

  Future<Either<CleanFailure, T>> get<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    Map<String, String>? queryParams,
    bool withToken = true,
  }) async {
    final Map<String, String> _header = header(withToken);

    final url = Uri.parse('${API.baseUrl}$endPoint')
        .replace(queryParameters: queryParams);
    Logger.v('URL : $url');

    try {
      final response = await client.get(url, headers: _header);

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } catch (e) {
      Logger.e("1st catch Header: $_header");
      Logger.e("1st catch Error: $e");
      return left(CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$url",
          header: _header,
          body: const {},
          error: e.toString()));
    }
  }

  Either<CleanFailure, T> handleResponse<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Response response,
  }) {
    if (isSuccessful(response.statusCode)) {
      Logger.d('Success: ${response.body}');
      final Map<String, dynamic> _regResponse = jsonDecode(response.body);

      try {
        final T _typedResponse = fromData(_regResponse);
        Logger.i("parsed data: $_typedResponse");
        return right(_typedResponse);
      } catch (e) {
        Logger.e('Error: $e');
        return left(
          CleanFailure.withData(
            tag: endPoint,
            url: response.request?.url.toString() ?? '',
            method: response.request?.method ?? "",
            statusCode: response.statusCode,
            header: response.request?.headers ?? {},
            body: _regResponse,
            error: jsonDecode(response.body),
          ),
        );
      }
    } else {
      Logger.e('else Error : ${response.statusCode}');
      Logger.e("else Error : ${response.body}");

      return left(
        CleanFailure.withData(
          tag: endPoint,
          url: response.request?.url.toString() ?? '',
          method: response.request?.method ?? "",
          statusCode: response.statusCode,
          header: response.request?.headers ?? {},
          body: const {},
          error: jsonDecode(response.body),
        ),
      );
    }
  }

  // TaskEither<CleanFailure, Response> makeGetRequest<T>({
  //   required String endPoint,
  //   required T Function(Map<String, dynamic> data) fromData,
  //   Map<String, String>? queryParams,
  //   bool withToken = true,
  // }) =>
  //     TaskEither.tryCatchK<L,R,fro>(run, onError)

  // Map<String, dynamic> mapToJson(Response response) =>
  //     jsonDecode(response.body) as Map<String, dynamic>;

  // TaskEither<CleanFailure, Map<String, dynamic>> mappingRequest(String url) =>
  //     makeGetRequest(url).map(mapToJson);

  // TaskEither<CleanFailure, String> validationRequest(
  //         Map<String, dynamic> json) =>
  //     !json.containsKey("pricing")
  //         ? TaskEither.left(MissingPricingRequestError())
  //         : TaskEither.of(json["pricing"].toString());

  // TaskEither<CleanFailure, T> getWithTask<T>({
  //   required String endPoint,
  //   required T Function(Map<String, dynamic> data) fromData,
  //   Map<String, String>? queryParams,
  //   bool withToken = true,
  // }) =>
  //     makeGetRequest(
  //       endPoint: endPoint,
  //       queryParams: queryParams,
  //       withToken: withToken,
  //     ).map(mapToJson).flatMap(validationRequest);

  static bool isSuccessful(int code) {
    return code >= 200 && code <= 206;
  }
}
