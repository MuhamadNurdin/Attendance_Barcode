import 'dart:convert';
import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/api.dart';
import 'package:meditation_app/common/api_factory/modules/attandance_api_module.dart';
import 'package:meditation_app/common/config/config.dart';
import 'package:meditation_app/common/config/prefs/pref_utils.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/common/widgets/log.dart';
import 'package:meditation_app/src/home/views/home_screen.dart';
// import 'package:meditation_app/screens/login_signup.dart';
import 'package:meditation_app/src/authentication/models/user_model.dart';
import 'package:meditation_app/src/authentication/controllers/signin_controller.dart';
import 'package:meditation_app/src/authentication/views/signin.dart';
// import 'package:odoo_common_code_latest/src/authentication/views/signin.dart';
// import 'package:odoo_common_code_latest/src/home/view/home.dart';

getVersionInfoAPI() {
  Api.getVersionInfo(
    onResponse: (response) {
      Api.getDatabases(
        serverVersionNumber: response.serverVersionInfo![0],
        onResponse: (response) {
          Log(response);
          Config.DB = response[0];
        },
        onError: (error, data) {
          handleApiError(error);
        },
      );
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

authenticationAPI(String email, String pass) {
  Api.authenticate(
    username: email,
    password: pass,
    database: Config.DB,
    onResponse: (UserModel response) {
      currentUser.value = response;
      PrefUtils.setIsLoggedIn(true);
      PrefUtils.setUser(jsonEncode(response));
      // getEmployeeId(currentUser.hashCode);
      Get.offAll(() => HomeScreen());
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

logoutApi() {
  Api.destroy(
    onResponse: (response) {
      PrefUtils.clearPrefs();
      Get.offAll(() => SignIn());
    },
    onError: (error, data) {
      handleApiError(error);
    },
  );
}

signUpApi(String emailout, String username) {
  Api.signUp(
      username: username,
      emailout: emailout,
      onResponse: (response) {
        print(response);
      },
      onError: (error, data) {
        handleApiError(error);
      });
}

forgetPassword(String email) {
  Api.forgotPassword(
      email: email,
      onResponse: (response) {
        response['error'] != 0
            ? showWarningForce("Email tidak ditemukan")
            : showWarning("Silahkan Cek Email");
      },
      onError: (error, data) {
        handleApiError(error);
      });
}
