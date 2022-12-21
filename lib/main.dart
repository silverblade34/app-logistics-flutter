import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logis02app/app/routes/pages.dart';
import 'package:logis02app/app/ui/themes/light_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    title: "Logistics v2",
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    theme: appThemeDataLight,
    defaultTransition: Transition.fade,
    getPages: AppPages.pages,
    builder: (context, myWidget) {
      myWidget = EasyLoading.init()(context, myWidget);
      return myWidget;
    },
  ));
}
