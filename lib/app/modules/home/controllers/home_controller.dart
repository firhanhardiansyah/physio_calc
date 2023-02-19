import 'package:get/get.dart';
import 'package:physio_calc/app/core/values/strings.dart';
import 'package:physio_calc/app/data/models/feature/feature_model.dart';
import 'package:physio_calc/app/routes/app_pages.dart';

class HomeController extends GetxController {
  List<FeatureModel> features = [];

  @override
  void onInit() {
    super.onInit();

    features.addAll([
      FeatureModel(
        id: 1,
        name: ugoFischScale,
        route: Routes.UGO_FISCH_SCALE,
        actived: true,
      ),
      FeatureModel(
        id: 2,
        name: barthelIndex,
        route: Routes.BARTHEL_INDEX,
        actived: true,
      ),
      FeatureModel(
        id: 3,
        name: bbs,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 4,
        name: gcs,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 5,
        name: mmse,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 6,
        name: nmq,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 7,
        name: odi,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 8,
        name: pcs,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 9,
        name: uefs,
        route: '',
        actived: false,
      ),
      FeatureModel(
        id: 10,
        name: womac,
        route: '',
        actived: false,
      ),
    ]);
  }

  void goToPage(FeatureModel feature) {
    Get.toNamed(feature.route, parameters: {'name': feature.name});
  }
}
