import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hues/constants.dart';
import 'package:hues/responsive_widget.dart';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase/firebase.dart' as fb;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:universal_html/html.dart' as html;

class SubmitPost extends StatefulWidget {
  @override
  _SubmitPostState createState() => _SubmitPostState();
}

class _SubmitPostState extends State<SubmitPost> {
  bool imageExists = false;
  bool isUploading = false;
  File imageFile;
  var postDbRef = Firestore.instance.collection('posts');
  String imageUrl;
  String userName;
  String userInsta;
  String writeUp;
  final Color appBarBg = Color(0xFFFAF3EA);
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _instaController = TextEditingController();
  TextEditingController _writeController = TextEditingController();

  Future<void> uploadImageFile(html.File image, {String imageName}) async {
    fb.StorageReference storageRef = fb.storage().ref('images/$imageName');
    fb.UploadTaskSnapshot uploadTaskSnapshot =
        await storageRef.put(image).future;

    Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
    setState(() {
      imageUrl = imageUri.toString();
      print(imageUrl);
    });
  }

  uploadImage() async {
    // HTML input element
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen(
      (changeEvent) {
        final file = uploadInput.files.first;
        final reader = FileReader();

        reader.readAsDataUrl(file);

        reader.onLoadEnd.listen(
          (loadEndEvent) async {
            imageFile = file;
            setState(() {
              imageExists = true;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isUploading,
      child: Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _nameController,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _instaController,
                        onChanged: (value) {
                          userInsta = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Instagram Username',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      child: TextFormField(
                        controller: _writeController,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
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
                              uploadImage();
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
                          setState(() {
                            isUploading = true;
                          });
                          await uploadImageFile(imageFile, imageName: userName);
                          await postDbRef.add({
                            'name': userName,
                            'insta': userInsta,
                            'writeUp': writeUp,
                            'imageUrl': imageUrl,
                          });

                          if (_formKey.currentState.validate() && imageExists) {
                            _writeController.clear();
                            _instaController.clear();
                            _nameController.clear();
                            setState(() {
                              isUploading = false;
                              imageExists = false;
                              imageFile = null;
                            });

                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Submitted Successfully!'),
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
      ),
    );
  }
}
