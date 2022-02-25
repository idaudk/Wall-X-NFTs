import 'package:get/get.dart';
import 'package:nft_app/ui/ui.dart';
import '../ui/ui.dart';

class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const OnBoardingUI()),
    GetPage(name: '/home', page: () => HomeUI()),
    GetPage(name: '/nft', page: () => NftUI()),

  ];
}