import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:otp_phone_auth/LocaleString.dart';
import 'package:otp_phone_auth/profile_selector.dart';

import 'language_selection.dart';
import 'phone.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyApp5HKg4CUrn5a0pzLMXWbrYV8ZNuuYi4",
      appId: "1:626516266409:android:992094883342bc1e5488b8",
      messagingSenderId: "",
      projectId: "otpphoneauth-a1d18",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: "OTP autentication",
      theme: ThemeData.light(),
      home: language_selection(),
      routes: <String, WidgetBuilder>{
        "/phonePage": (BuildContext context) => phone(),
        "/langPage": (BuildContext context) => language_selection(),
      },
    );
  }
}
