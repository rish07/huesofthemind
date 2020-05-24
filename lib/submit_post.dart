import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hues/responsive_widget.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'dart:typed_data';

class SubmitPost extends StatefulWidget {
  @override
  _SubmitPostState createState() => _SubmitPostState();
}

class _SubmitPostState extends State<SubmitPost> {
  String userName;
  String userInsta;
  String writeUp;
  final Color appBarBg = Color(0xFFFAF3EA);
  final _formKey = GlobalKey<FormState>();
  String pickedImage;
  bool imageExists = false;
  pickImage() async {
    Uint8List bytesFromPicker =
        await ImagePickerWeb.getImage(outputType: ImageType.bytes);
    if (bytesFromPicker != null) {
      setState(() {
        imageExists = true;
        pickedImage = base64Encode(bytesFromPicker);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final HttpsCallable callable = CloudFunctions.instance
        .getHttpsCallable(functionName: 'sendEmail')
          ..timeout = const Duration(seconds: 30);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: appBarBg,
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: !ResponsiveWidget.isSmallScreen(context)
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Please fill in the details:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Container(
                    child: TextFormField(
                      onChanged: (value) {
                        userName = value;
                      },
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    child: TextFormField(
                      onChanged: (value) {
                        userInsta = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Instagram Username',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    child: TextFormField(
                      onChanged: (value) {
                        writeUp = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This is a mandatory field';
                        }
                        return null;
                      },
                      maxLines:
                          ResponsiveWidget.isSmallScreen(context) ? 4 : 10,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Write up',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text('Upload an image:   '),
                      ),
                      Flexible(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: AutoSizeText(
                            'Choose a file',
                            maxLines: 1,
                          ),
                          color: Colors.grey,
                          onPressed: () {
                            pickImage();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Flexible(
                    child: MaterialButton(
                      minWidth: 200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      color: Colors.black,
                      onPressed: () async {
                        try {
                          final HttpsCallableResult result =
                              await callable.call({
                            'name': userName,
                            'insta': userInsta,
                            'writeUp': writeUp,
                            'image': pickedImage,
                          });
                          print(userName);
                          print(userInsta);
                          print(result.data);
                        } on CloudFunctionsException catch (e) {
                          print('caught firebase functions exception');
                          print(e.code);
                          print(e.message);
                          print(e.details);
                        } catch (e) {
                          print('caught generic exception');
                          print(e);
                        }
                        if (_formKey.currentState.validate() && imageExists) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('working perfectly'),
                            ),
                          );
                        } else if (imageExists == false) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please upload an Image!'),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
