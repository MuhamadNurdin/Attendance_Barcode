import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditation_app/common/api_factory/modules/authentication_module.dart';
import 'package:meditation_app/common/config/app_colors.dart';
import 'package:meditation_app/common/config/localization/localize.dart';
import 'package:meditation_app/common/utils/utils.dart';
import 'package:meditation_app/common/widgets/custom_button.dart';
import 'package:meditation_app/common/widgets/main_container.dart';
import 'package:meditation_app/common/widgets/text_input.dart';

class SignIn1 extends StatefulWidget {
  @override
  _SignIn1State createState() => _SignIn1State();
}

class _SignIn1State extends State<SignIn1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    getVersionInfoAPI();
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isAppBar: true,
      appBarTitle: Localize.signin.tr,
      padding: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          TextInput(
            textInputAction: TextInputAction.next,
            borderRadius: BorderRadius.circular(10.0),
            controller: _emailController,
            textInputType: TextInputType.emailAddress,
            hintText: Localize.email.tr,
          ),
          SizedBox(
            height: 12,
          ),
          TextInput(
            borderRadius: BorderRadius.circular(10.0),
            controller: _passCtrl,
            isPassword: true,
            hintText: Localize.password.tr,
          ),
          SizedBox(
            height: 17,
          ),
          SizedBox(
            height: 55,
            child: CustomButton(
              color: AppColors.orange,
              onPress: () {
                FocusManager.instance.primaryFocus!.unfocus();
                if (_emailController.text.isEmpty) {
                  showWarning("Please enter email");
                } else if (_passCtrl.text.isEmpty) {
                  showWarning("Please enter password");
                } else {
                  authenticationAPI(_emailController.text, _passCtrl.text);
                }
              },
              child: Text(
                Localize.signin.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
