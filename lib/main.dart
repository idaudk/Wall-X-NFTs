import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nft_app/constants/constants.dart';
import 'controllers/controllers.dart';

void main() async {
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return ScreenUtilInit(builder: () {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'X Wall NFTs',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.lightTheme,
        themeMode: ThemeMode.system,
        initialRoute: "/",
        defaultTransition: AppThemes.defaultTranstion,
        getPages: AppRoutes.routes,
      );
    });
  }
}
