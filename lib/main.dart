import 'package:dynamic_languages/dynamic_languages.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'backend/services/api_endpoint.dart';
import 'backend/utils/network_check/dependency_injection.dart';
import 'controller/settings/basic_settings_controller.dart';
import 'backend/language/english.dart';

void main() async {
  InternetCheckDependencyInjection.init();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: Themes().theme,
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Routes.list,
        initialBinding: BindingsBuilder(() async {
          Get.put(BasicSettingsController(), permanent: true);
          await DynamicLanguage.init(url: ApiEndpoint.languageURL);
        }),
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(0.87)),
              child: Directionality(
                  textDirection: DynamicLanguage.isLoading
                      ? TextDirection.ltr
                      : DynamicLanguage.languageDirection,
                  child: widget!));
        },
      ),
    );
  }
}