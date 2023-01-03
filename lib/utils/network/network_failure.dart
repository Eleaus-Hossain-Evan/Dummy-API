import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easylogger/flutter_logger.dart';

class CleanFailure extends Equatable {
  final String tag;
  final String error;
  final bool _enableDialogue;
  final int statusCode;

  const CleanFailure(
      {required this.tag,
      required this.error,
      bool enableDialogue = true,
      this.statusCode = -1})
      : _enableDialogue = enableDialogue;

  CleanFailure copyWith({String? tag, String? error, int? statusCode}) {
    return CleanFailure(
        tag: tag ?? this.tag,
        error: error ?? this.error,
        statusCode: statusCode ?? this.statusCode);
  }

  factory CleanFailure.withData(
      {required String tag,
      required String url,
      required String method,
      required int statusCode,
      required Map<String, String> header,
      required Map<String, dynamic> body,
      bool enableDialogue = true,
      required dynamic error}) {
    final String _tag = tag == 'Type' ? url : tag;
    final Map<String, dynamic> _errorMap = {
      'url': url,
      'method': method,
      if (header.isNotEmpty) 'header': header,
      if (body.isNotEmpty) 'body': body,
      'error': error,
      if (statusCode > 0) 'status_code': statusCode
    };
    final encoder = JsonEncoder.withIndent(' ' * 2);
    // return encoder.convert(toJson());
    final String _errorStr = encoder.convert(_errorMap);
    return CleanFailure(
        tag: _tag,
        error: _errorStr,
        enableDialogue: enableDialogue,
        statusCode: statusCode);
  }
  factory CleanFailure.none() => const CleanFailure(tag: '', error: '');

  @override
  String toString() => 'CleanFailure(type: $tag, error: $error)';

  showDialogue(BuildContext context) {
    if (_enableDialogue) {
      CleanFailureDialogue.show(context, failure: this);
    } else {
      Logger.e(this);
    }
  }

  @override
  List<Object> get props => [tag, error];
}

class CleanFailureDialogue extends StatelessWidget {
  final CleanFailure failure;
  const CleanFailureDialogue(this.failure, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentTextStyle: const TextStyle(color: Colors.black),
      titleTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error_outline_sharp,
            color: Colors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              failure.tag,
              maxLines: 2,
            ),
          ),
        ],
      ),
      content: Text(
        failure.error,
        maxLines: 4,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ignore')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, shape: const StadiumBorder()),
            onPressed: () {
              Navigator.of(context).pop();

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      CleanFailureDetailsPage(failure: failure)));
            },
            child: const Text('View details'))
      ],
    );
  }

  static show(BuildContext context, {required CleanFailure failure}) {
    if (failure != CleanFailure.none()) {
      showDialog(
          context: context,
          builder: (context) => CleanFailureDialogue(failure));
    }
  }
}

class CleanFailureDetailsPage extends StatelessWidget {
  final CleanFailure failure;
  const CleanFailureDetailsPage({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.red[100],
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.error_outline_rounded,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Error',
                        style: TextStyle(fontSize: 40),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: const StadiumBorder(),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              visualDensity: VisualDensity.compact),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.arrow_left_circle,
                                  color: Colors.purple[900]),
                              Text('Go back',
                                  style: TextStyle(color: Colors.purple[900])),
                            ],
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  width: 2, color: Colors.purple[900]!),
                              shape: const StadiumBorder(),
                              visualDensity: VisualDensity.compact),
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: failure.error));
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Copied to Clipboard')));
                          },
                          child: Text('Copy code',
                              style: TextStyle(color: Colors.purple[900]))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                children: [
                  Text(
                    failure.tag,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    failure.error,
                    style: const TextStyle(color: Colors.red),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
