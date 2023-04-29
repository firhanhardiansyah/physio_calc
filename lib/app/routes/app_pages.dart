import 'package:get/get.dart';

import '../modules/features/barthel_index/bindings/barthel_index_binding.dart';
import '../modules/features/barthel_index/views/barthel_index_view.dart';
import '../modules/features/bbs/bindings/bbs_binding.dart';
import '../modules/features/bbs/views/bbs_view.dart';
import '../modules/features/gcs/bindings/gcs_binding.dart';
import '../modules/features/gcs/views/gcs_view.dart';
import '../modules/features/mmse/bindings/mmse_binding.dart';
import '../modules/features/mmse/views/mmse_view.dart';
import '../modules/features/nmq/bindings/nmq_binding.dart';
import '../modules/features/nmq/views/nmq_view.dart';
import '../modules/features/odi/bindings/odi_binding.dart';
import '../modules/features/odi/views/odi_view.dart';
import '../modules/features/pcs/bindings/pcs_binding.dart';
import '../modules/features/pcs/views/pcs_view.dart';
import '../modules/features/ugo_fisch_scale/bindings/ugo_fisch_scale_binding.dart';
import '../modules/features/ugo_fisch_scale/views/ugo_fisch_scale_view.dart';
import '../modules/features/womac/bindings/womac_binding.dart';
import '../modules/features/womac/views/womac_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

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
      name: _Paths.UGO_FISCH_SCALE,
      page: () => const UgoFischScaleView(),
      binding: UgoFischScaleBinding(),
    ),
    GetPage(
      name: _Paths.BARTHEL_INDEX,
      page: () => const BarthelIndexView(),
      binding: BarthelIndexBinding(),
    ),
    GetPage(
      name: _Paths.BBS,
      page: () => const BbsView(),
      binding: BbsBinding(),
    ),
    GetPage(
      name: _Paths.GCS,
      page: () => const GcsView(),
      binding: GcsBinding(),
    ),
    GetPage(
      name: _Paths.MMSE,
      page: () => const MmseView(),
      binding: MmseBinding(),
    ),
    GetPage(
      name: _Paths.NMQ,
      page: () => const NmqView(),
      binding: NmqBinding(),
    ),
    GetPage(
      name: _Paths.ODI,
      page: () => const OdiView(),
      binding: OdiBinding(),
    ),
    GetPage(
      name: _Paths.WOMAC,
      page: () => const WomacView(),
      binding: WomacBinding(),
    ),
    GetPage(
      name: _Paths.PCS,
      page: () => const PcsView(),
      binding: PcsBinding(),
    ),
  ];
}
