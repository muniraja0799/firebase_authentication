// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

class LoginController extends GetxController {
  var isHiddenPassword = true.obs;
  var showSpinner = false.obs;
  final RxString emailAddress = ''.obs;
  final RxString password = ''.obs;
  final RxString validEmail = ''.obs;
  final RxString validCredentials = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}