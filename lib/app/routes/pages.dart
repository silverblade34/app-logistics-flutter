import 'package:get/get.dart';
import 'package:logis02app/app/bindings/finalped_binding.dart';
import 'package:logis02app/app/bindings/hojaruta_binding.dart';
import 'package:logis02app/app/bindings/login_binding.dart';
import 'package:logis02app/app/bindings/map_binding.dart';
import 'package:logis02app/app/bindings/peds_binding.dart';
import 'package:logis02app/app/middleware/auth_middleware.dart';
import 'package:logis02app/app/ui/pages/finalped/finalped_page.dart';
import 'package:logis02app/app/ui/pages/hojaruta/hojaruta_page.dart';
import 'package:logis02app/app/ui/pages/login/login_page.dart';
import 'package:logis02app/app/ui/pages/map/map_page.dart';
import 'package:logis02app/app/ui/pages/peds/peds_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.HOJARUT,
      page: () => HojaRutaPage(),
      binding: HojaRutaBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.PEDS,
      page: () => PedsPage(),
      binding: PedsBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.MAP,
      page: () => MapPage(),
      binding: MapBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CONFIRM,
      page: () => FinalPedPage(),
      binding: FinalPedBinding(),
      transition: Transition.fadeIn,
      middlewares: [AuthMiddleware()],
    ),
  ];
}
