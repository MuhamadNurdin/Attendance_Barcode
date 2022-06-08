import 'package:get/get.dart';
import 'package:meditation_app/common/config/prefs/pref_utils.dart';
import 'package:meditation_app/src/authentication/models/user_model.dart';

var currentUser = UserModel().obs;

class SignInController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    currentUser.value = await PrefUtils.getUser();
  }
}
