import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/strings.dart';


final hiveProvider = Provider<StorageHandler>((_) => StorageHandler());

class StorageHandler {

  late Box _cacheBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _cacheBox = await Hive.openBox(KStrings.cacheBox);
  }

  dynamic get(String tag, {dynamic defaultValue}) {
    return _cacheBox.get(tag, defaultValue: defaultValue);
  }

  void put(String tag, dynamic value) {
    _cacheBox.put(tag, value);
  }
}
