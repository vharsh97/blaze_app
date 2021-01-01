import 'package:flutter/material.dart';
import 'package:object_detection/bg-image.dart';
import 'package:object_detection/utils/Constants.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blaze"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: aboutDialog,
          ),
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, "/login");
              }),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BgImage(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 3),
                  ButtonTheme(
                    buttonColor: Colors.deepOrangeAccent,
                    minWidth: 170,
                    child: RaisedButton(
                      child: Text(
                        "Detect in Image",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, "/staticfeed");
                      },
                    ),
                  ),
                  ButtonTheme(
                    buttonColor: Colors.deepOrangeAccent,
                    minWidth: 160,
                    child: RaisedButton(
                      child: Text(
                        "Real Time Detection",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed:() {
                        Navigator.pushNamed(context, "/livefeed");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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