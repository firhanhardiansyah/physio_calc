import 'package:get/get.dart';

import '../modules/features/barthel_index/bindings/barthel_index_binding.dart';
import '../modules/features/barthel_index/views/barthel_index_view.dart';
import '../modules/features/ugo_fisch_scale/bindings/ugo_fisch_scale_binding.dart';
import '../modules/features/ugo_fisch_scale/views/ugo_fisch_scale_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/user_identity/bindings/user_identity_binding.dart';
import '../modules/user_identity/views/user_identity_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USER_IDENTITY,
      page: () => const UserIdentityView(),
      binding: UserIdentityBinding(),
    ),
    GetPage(
      name: _Paths.UGO_FISCH_SCALE,
      page: () => const UgoFischScaleView(),
      binding: UgoFischScaleBinding(),
    ),
    GetPage(
      name: _Paths.BARTHEL_INDEX,
      page: () => const BarthelIndexView(),
      binding: BarthelIndexBinding(),
    ),
  ];
}
