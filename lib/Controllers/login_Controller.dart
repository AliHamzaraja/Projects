import 'package:get/get.dart';

class loginController extends GetxController {
  var islogin = true;
  var isloading = false;

  SetScreen() {
    islogin = !islogin;
    update();
  }

  changeloadingtrue() {
    isloading = true;
    update();
  }

  changeloadingfalse() {
    isloading = false;
    update();
  }
}
