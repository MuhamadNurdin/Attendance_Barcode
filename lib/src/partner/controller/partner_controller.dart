import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/modules/partner_api_module.dart';
import 'package:meditation_app/src/partner/model/res_partner_model.dart';

class PartnerController extends GetxController {
  var listOfPartners = <Records>[].obs;

  getPartners() {
    resPartnerApi(
      onResponse: (response) {
        listOfPartners.assignAll(response.records!);
      },
    );
  }
}
