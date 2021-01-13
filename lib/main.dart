import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/Pages/home_page.dart';
import 'package:object_detection/Pages/login_page.dart';
import 'package:object_detection/static%20image/static.dart';
import 'package:object_detection/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();

  cameras = await availableCameras();
  // running the app
  runApp(
    MaterialApp(
      title: "Blaze",
      home: Constants.prefs.getBool("loggedIn") == true
          ? MyApp()
          : LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.teal,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black26)),
      ),
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => MyApp(),
        "/staticfeed": (context) => StaticImage(),
      },
    )
  );
}


