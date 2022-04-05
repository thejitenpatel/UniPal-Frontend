import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Routers
import 'src/config/routes/app_router.dart';

// Helpers
import 'src/helpers/constants/app_colors.dart';
import 'src/helpers/constants/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'UniPal';
    const showDebugBanner = false;
    final navigatorObservers = <NavigatorObserver>[SentryNavigatorObserver()];
    final platformIsIOS = Platform.isIOS;
    final app = platformIsIOS
        ? Theme(
            data: AppThemes.mainTheme,
            child: CupertinoApp(
              title: title,
              navigatorObservers: navigatorObservers,
              debugShowCheckedModeBanner: showDebugBanner,
              initialRoute: AppRouter.initialRoute,
              color: AppColors.primaryColor,
              onGenerateRoute: AppRouter.generateRoute,
              navigatorKey: AppRouter.navigatorKey,
            ),
          )
        : MaterialApp(
            title: title,
            navigatorObservers: navigatorObservers,
            debugShowCheckedModeBanner: showDebugBanner,
            color: AppColors.primaryColor,
            theme: AppThemes.mainTheme,
            initialRoute: AppRouter.initialRoute,
            onGenerateRoute: AppRouter.generateRoute,
            navigatorKey: AppRouter.navigatorKey,
          );
    return ProviderScope(child: app);
  }
}
