// ignore_for_file: no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';

import 'network_failure.dart';

export 'network_failure.dart';
export 'package:fpdart/fpdart.dart';

class NetworkHandler {
  NetworkHandler._();

  static final NetworkHandler instance = NetworkHandler._();

  String? _token;
  late String _baseUrl;
  late bool _enableDialogue;
  late Client client;

  void setup(
      {required String baseUrl,
      bool showLogs = false,
      bool enableDialogue = true}) {
    client = Client();
    _baseUrl = baseUrl;
    _enableDialogue = enableDialogue;
  }

  void setToken(String? token) => _token = token;

  Map<String, String> header(bool withToken) {
    if (withToken) {
      return {
        'Content-Type': 'application/json',
        'Content': 'application/json',
        'Accept': 'application/json',
        if (_token != null && _token!.isNotEmpty) "Authorization": "$_token"
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
    bool withToken = true,
  }) async {
    final Map<String, String> _headerS = header(withToken);

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_headerS');

    try {
      final response = await client.get(
        url,
        headers: _headerS,
      );

      return handleResponse<T>(
        response: response,
        endPoint: endPoint,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e("<<SocketException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _headerS,
          body: const {},
          error: const {"message": 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e("<<HttpException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _headerS,
          body: const {},
          error: const {"message": "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e("<<FormatException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _headerS,
          body: const {},
          error: const {"message": "Bad response format 👎"},
        ),
      );
    } catch (e) {
      Logger.e("1st catch Header: $_headerS");
      Logger.e("1st catch Error: $e");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _headerS,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> post<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    bool withToken = true,
  }) async {
    final Map<String, String> _header = header(withToken);

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final response = await client.post(
        url,
        headers: _header,
        body: jsonEncode(body),
      );

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e("<<SocketException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e("<<HttpException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e("<<FormatException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": "Bad response format 👎"},
        ),
      );
    } catch (e) {
      Logger.e("1st catch Header: $_header");
      Logger.e("1st catch Error: $e");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> put<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    bool withToken = true,
  }) async {
    Logger.v('BODY : $body');

    final Map<String, String> _header = header(withToken);

    final url = Uri.parse('$_baseUrl$endPoint');
    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final response = await client.put(
        url,
        headers: _header,
        body: jsonEncode(body),
      );

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e("<<SocketException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e("<<HttpException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e("<<FormatException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": "Bad response format 👎"},
        ),
      );
    } catch (e) {
      Logger.e("1st catch Header: $_header");
      Logger.e("1st catch Error: $e");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Future<Either<CleanFailure, T>> patch<T>({
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
    required Map<String, dynamic> body,
    bool withToken = true,
  }) async {
    final Map<String, String> _header = header(withToken);

    final url = Uri.parse('$_baseUrl$endPoint');

    Logger.v('URL : $url, Header : $_header');
    Logger.v('BODY : $body');

    try {
      final response = await client.patch(
        url,
        headers: _header,
        body: jsonEncode(body),
      );

      return handleResponse(
        endPoint: endPoint,
        response: response,
        fromData: fromData,
      );
    } on SocketException {
      Logger.e("<<SocketException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": 'No Internet connection 😑'},
        ),
      );
    } on HttpException {
      Logger.e("<<HttpException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": "Couldn't find 😱"},
        ),
      );
    } on FormatException {
      Logger.e("<<FormatException>>");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: const {"message": "Bad response format 👎"},
        ),
      );
    } catch (e) {
      Logger.e("1st catch Header: $_header");
      Logger.e("1st catch Error: $e");
      return left(
        CleanFailure.withData(
          statusCode: -1,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: 'GET',
          url: "$_baseUrl$endPoint",
          header: _header,
          body: const {},
          error: e.toString(),
        ),
      );
    }
  }

  Either<CleanFailure, T> handleResponse<T>({
    required Response response,
    required String endPoint,
    required T Function(Map<String, dynamic> data) fromData,
  }) {
    Logger.v("request: ${response.request}");
    Logger.json(response.body);

    if (isSuccessful(response.statusCode)) {
      final Map<String, dynamic> _regResponse = jsonDecode(response.body);

      try {
        final T _typedResponse = fromData(_regResponse);
        Logger.i("parsed data: $_typedResponse");
        return right(_typedResponse);
      } catch (e) {
        Logger.w("header: ${response.request?.headers}");
        // Logger.w("request: ${response.request}");

        Logger.w("body: ${response.body}");
        Logger.w("status code: ${response.statusCode}");
        Logger.w("error: $e");
        return left(
          CleanFailure.withData(
            tag: endPoint,
            url: response.request?.url.toString() ?? '',
            method: response.request?.method ?? "",
            statusCode: response.statusCode,
            header: response.request?.headers ?? {},
            body: _regResponse,
            error: e,
          ),
        );
      }
    } else {
      Logger.e("header: ${response.request?.headers}");

      Logger.e("body: ${response.body}");
      Logger.e("status code: ${response.statusCode}");

      return left(
        CleanFailure.withData(
          statusCode: response.statusCode,
          enableDialogue: _enableDialogue,
          tag: endPoint,
          method: response.request?.method ?? "",
          url: response.request?.url.toString() ?? '',
          header: response.request?.headers ?? {},
          body: const {},
          error: jsonDecode(response.body),
        ),
      );
    }
  }

  static bool isSuccessful(int code) {
    return code >= 200 && code <= 299;
  }
}
