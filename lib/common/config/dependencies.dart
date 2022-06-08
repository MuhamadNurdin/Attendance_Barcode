import 'package:get/get.dart';
import 'package:meditation_app/src/authentication/controllers/signin_controller.dart';

class Dependencies {
  Dependencies._();

  static void injectDependencies() {
    Get.put(SignInController());
  }
}
