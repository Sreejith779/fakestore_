import 'package:fakestore/app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  Future<bool>login( )async{
    final auth = FirebaseAuth.instance;
    String email = emailController.value.text;
    String password = passwordController.value.text;
    try{
      print("Loginnnn");
     UserCredential user = await auth.signInWithEmailAndPassword(
         email: email, password: password);
     if(user.user!=null){
       Get.toNamed(AppRoutes.homePage);
       print("Login Sucess");
       return true;
     }else{
       print("Login failed");
       Get.snackbar("Login Failed", "please check email and password");
     return false;
     }
    }
        catch(e){ FirebaseAuthException(code: "error");
        Get.snackbar("Login Failed", "please check email and password");
      return false;

        }
  }
}