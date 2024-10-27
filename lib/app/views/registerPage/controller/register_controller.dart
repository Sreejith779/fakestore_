import 'package:fakestore/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final cPassController = TextEditingController();

  Future<bool>registerUser()async{

    final auth = FirebaseAuth.instance;
    String email = emailController.value.text;
    String password = passController.value.text;

    try{
      print(email);
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Get.toNamed(AppRoutes.loginPage);
      Get.snackbar("Registered Successfully", "success");
return true;
    }catch(e){
      print(FirebaseAuthException(code: "error"));
      return false;
    }
  }
}