import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fakestore/app/routes/app_pages.dart';
import 'package:fakestore/app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options:DefaultFirebaseOptions.currentPlatform
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}
