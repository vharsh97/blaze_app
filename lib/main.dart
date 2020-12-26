import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/realtime/live_camera.dart';
import 'package:object_detection/static%20image/static.dart';
List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // running the app
  runApp(
    MaterialApp(
      title: "Blaze",
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.teal,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black26)),
      ),
    )
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blaze - Fire & Smoke Detector"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: aboutDialog,
          ),
        ],
      ),
      body: Container(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                buttonColor: Colors.deepOrangeAccent,
                minWidth: 170,
                child: RaisedButton(
                  child: Text("Detect in Image"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => StaticImage(),
                      ),
                    );
                  },
                ),
              ),
              ButtonTheme(
                buttonColor: Colors.deepOrangeAccent,
                minWidth: 160,
                child: RaisedButton(
                  child: Text("Real Time Detection"),
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LiveFeed(cameras),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  aboutDialog(){
     showAboutDialog(
      context: context,
      applicationName: "Blaze - A Fire and Smoke detector ",
      applicationLegalese: "By Team Blaze",
      applicationVersion: "1.0",
    );
  }

}