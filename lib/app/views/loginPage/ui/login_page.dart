import 'package:fakestore/app/global/buttons.dart';
import 'package:fakestore/app/utils/styles.dart';
import 'package:fakestore/app/views/homePage/controller/home_controller.dart';
import 'package:fakestore/app/views/loginPage/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    Get.lazyPut(() => HomeController());

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textFormField(
                "Email",
                controller.emailController,
                (value) {
                  if (value == null || value.isEmpty) {
                    return "Email must not be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              _textFormField(
                "Password",
                controller.passwordController,
                (value) {
                  if (value == null || value.isEmpty) {
                    return "Password must not be empty";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              OutlineButton(
                text: "Login",
                color: Colors.deepPurple,
                fontsize: 20,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    HomeController homeController = Get.find<HomeController>();
                    homeController.getAllProducts();
                    await controller.login();
                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.registerPage);
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: style(14, FontWeight.w600, Colors.black),
                      ),
                      TextSpan(
                        text: ' Register',
                        style: style(14, FontWeight.w600, Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormField(
    String hintText,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
