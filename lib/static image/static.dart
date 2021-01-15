import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class StaticImage extends StatefulWidget {
  StaticImage() : super();

  final String title = "Detect in Image";

  @override
  StaticImageState createState() => StaticImageState();
}

class StaticImageState extends State<StaticImage> {
  //
  static final String uploadEndPoint =
      'http://ec2-18-223-15-148.us-east-2.compute.amazonaws.com:8080/image/';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  bool _isVisible = false;

  getImageFromGallery() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
      print("file is : $file");
    });
    setStatus('');
    showUpload();
  }

  getImageFromCamera() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.camera);
      print("file is : $file");
    });
    setStatus('');
    showUpload();
  }

  showUpload() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Predicting Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path;
    print(fileName);
    upload(fileName);
  }

  upload(String fileName) async{
    var request = http.MultipartRequest('POST', Uri.parse(uploadEndPoint));
    request.files.add(await http.MultipartFile.fromPath('images', fileName));
    http.Response response = await http.Response.fromStream(await request.send());
    print("Result: ${response.statusCode}");
    print(response.body);

    if(response.statusCode==200)
      setStatus("Predicted Image");
    else
      setStatus(response.reasonPhrase);

    setState(() {
      base64Image = response.body;
    });

    showUpload();
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (null != base64Image) {
          return Flexible(
            child: Image.memory(
              Base64Codec().decode(base64Image),
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.height / 2,
              height: MediaQuery.of(context).size.height / 3,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          return Flexible(
            child: Image.file(
              tmpFile,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.height / 2,
              height: MediaQuery.of(context).size.height / 3,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        }  else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detect in Image"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 8),
                  showImage(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  status == 'Predicted Image' ?
                    ButtonTheme(
                      buttonColor: Colors.deepOrangeAccent,
                      minWidth: 170,
                      child: RaisedButton(
                        child: Text(
                        "New Prediction",
                        style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                        Navigator.pushNamed(context, "/home");
                        },
                        ),
                    ) :
                  Visibility(
                    child: ButtonTheme(
                      buttonColor: Colors.deepOrangeAccent,
                      minWidth: 170,
                      child: RaisedButton(
                        child:  Text(
                          "Upload",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: startUpload,
                      ),
                    ),
                    visible: _isVisible,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: status == 'Predicted Image' ? Opacity(
        opacity: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "Fltbtn2",
              child: Icon(Icons.camera_alt),
              onPressed: null,
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              heroTag: "Fltbtn1",
              child: Icon(Icons.photo),
              onPressed: null,
            ),
          ],
        ),
      ) : Opacity(
          opacity: 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "Fltbtn2",
                child: Icon(Icons.camera_alt),
                onPressed: getImageFromCamera,
              ),
              SizedBox(width: 10,),
              FloatingActionButton(
                heroTag: "Fltbtn1",
                child: Icon(Icons.photo),
                onPressed: getImageFromGallery,
              ),
            ],
          ),
      )
    );
  }
}
