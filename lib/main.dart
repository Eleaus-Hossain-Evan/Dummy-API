import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'route/go_router.dart';
import 'presentation/styles/k_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/local_storage/storage_handler.dart';
import 'utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(
    observers: [
      ProviderLog(),
    ],
  );

  Logger.init(
    true, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
    levelVerbose: 247,
    levelDebug: 15,
    levelInfo: 10,
    levelWarn: 5,
    levelError: 9,
    phoneVerbose: Colors.white,
    phoneDebug: Colors.lightBlue,
    phoneInfo: Colors.greenAccent,
    phoneWarn: Colors.yellow.shade600,
    phoneError: Colors.redAccent,
  );

  final box = container.read(hiveProvider);
  await box.init();

  box.put(KStrings.token, '61c74a1797e6fe20b5557de7');

  final String token = box.get(KStrings.token, defaultValue: '');

  NetworkHandler.instance
    ..setup(baseUrl: APIRoute.baseURL, showLogs: false)
    ..setToken(token);

  Logger.d('token: $token');

  runApp(
    ProviderScope(
      parent: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
      designSize: const Size(411.4, 843.4),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: KThemeData.mainTheme,
          routerConfig: router,
          builder: BotToastInit(),
        );
      },
    );
  }
}

class ProviderLog extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.d('''
{
  "PROVIDER": "${provider.name}; ${provider.runtimeType.toString()}"
  
}''');
    log("$newValue");
  }
}
