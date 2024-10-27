import 'package:fakestore/app/global/buttons.dart';
import 'package:fakestore/app/views/registerPage/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utils/styles.dart';

class Registerpage extends StatelessWidget {
  Registerpage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textFormField(
                "Name",
                    (val) {
                  if (val == null || val.isEmpty) {
                    return "Name must not be empty";
                  }
                  return null; // Return null if valid
                },
                controller.nameController,
              ),
              _textFormField(
                "Email",
                    (val) {
                  if (val == null || val.isEmpty) {
                    return "Email must not be empty";
                  }
                  return null; // Return null if valid
                },
                controller.emailController,
              ),
              _textFormField(
                "Password",
                    (val) {
                  if (val == null || val.isEmpty) {
                    return "Password must not be empty";
                  }
                  return null; // Return null if valid
                },
                controller.passController,
              ),
              _textFormField(
                "Confirm Password",
                    (val) {
                  if (val == null || val.isEmpty) {
                    return "Confirm Password must not be empty";
                  }
                  if (val != controller.passController.text) {
                    return "Passwords do not match";
                  }
                  return null; // Return null if valid
                },
                controller.cPassController,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              OutlineButton(
                text: "Sign Up",
                fontsize: 16,
                color: Colors.deepPurple,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.registerUser();
                  }
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.loginPage);
                },
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Have an account?',
                        style: style(14, FontWeight.w600, Colors.black),
                      ),
                      TextSpan(
                        text: ' Login',
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
      String hintText, FormFieldValidator<String> validator, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.02),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
