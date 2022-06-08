import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/modules/employee_api_module.dart';
import 'package:meditation_app/src/home/models/home_models.dart';

// var empData = Records().obs;

class HomeController extends GetxController {
  // var employeeData = <Records>[].obs;
  // var empData = Records().obs;
  RxInt log2 = 0.obs;

  void change() => log2.value++;

  // @override
  // void onInit() {
  //   getEmloyee();
  //   super.onInit();
  // }

  // getEmloyee() {
  //   employeeApi(
  //     onResponse: (response) {
  //       // var dataEmp = (response.records as List<dynamic>)[0];
  //       // employeeData.assignAll(response.records!);
  //       // emplloyeeId.value = response.id;
  //       empData.value = response;
  //     },
  //   );
  // }
}
