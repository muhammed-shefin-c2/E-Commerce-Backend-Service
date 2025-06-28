import 'package:flutter/material.dart';
import 'package:commerce_js_mobile_app/Screens/Splash_Screen1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:commerce_js_mobile_app/firebase_options.dart';
//import 'package:mini_project/offfer%20data/Offer_Data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: SplashScreen1(),
    );
  }
}
