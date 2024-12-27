import 'package:flutter/material.dart';
import 'package:login_signup_task/models/sign_up_model.dart';
import 'package:login_signup_task/services/regestration_service.dart';

class RegistrationProvider extends ChangeNotifier {
  RegistrationModel? registrationModel;

  loginDataProvider({required String email, required String password}) async {
    registrationModel =
        await RegistrationServices.loginData(email: email, password: password);
    notifyListeners();
  }

  signUpDataProvider(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    registrationModel = await RegistrationServices.signUpData(
        email: email, password: password, name: name, phone: phone);
    notifyListeners();
  }
}
