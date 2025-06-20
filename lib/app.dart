import 'package:cwt_ecommerce_admin_panel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/general_bindings.dart';
import 'common/widgets/page_not_found/page_not_found.dart';
import 'routes/app_routes.dart';
import 'routes/route_observer.dart';
import 'utils/constants/text_strings.dart';
import 'utils/device/web_material_scroll.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      navigatorObservers: [RouteObservers()],
      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: TRoutes.places,
      getPages: TAppRoute.pages,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => const TPageNotFound(
          isFullPage: true,
          title: 'Oops! You\'ve Ventured into the Abyss of the Internet!',
          subTitle:
              'Looks like you’ve discovered the Bermuda Triangle of our app. Don\'t worry, we won’t let you stay lost forever. Click the button below to return to safety!',
        ),
      ),

    );
  }
}
