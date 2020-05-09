import 'package:flutter/material.dart';
import 'constants.dart';

const String randomCaption =
    "'This is a random caption to check how it looks. I never thought writing a random caption would be this hard. I cant even think what to write'";

const String randomCat = 'profile/cat.jpeg';
List<Widget> profilesSmallScreen = [
  //Manasi
  smallProfileCard(
    name: 'Manasi Gupta',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Lavanya
  smallProfileCard(
    name: 'Lavanya',
    imagesrc: randomCat,
    caption: randomCaption,
  ),

  //Rishi
  smallProfileCard(
    name: 'Rishi Raj Singh',
    imagesrc: 'profile/rishi.jpeg',
    caption: randomCaption,
  ),

  //Shrey
  smallProfileCard(
    name: 'Shrey',
    imagesrc: randomCat,
    caption: randomCaption,
  ),

  //Shristi
  smallProfileCard(
    name: 'Shristi',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Rohit
  smallProfileCard(
    name: 'Rohit',
    imagesrc: randomCat,
    caption: randomCaption,
  ),

  //Goutam
  smallProfileCard(
    name: 'Goutam Sree Govind',
    imagesrc: 'profile/goutam.jpg',
    caption: randomCaption,
  ),

  //Nomit
  smallProfileCard(
    name: 'Nomit',
    imagesrc: randomCat,
    caption: randomCaption,
  )
];

List<Widget> profilesNormal = [
  //Manasi
  profileCard(
    name: 'Manasi Gupta',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Lavanya
  profileCard(
    name: 'Lavanya',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Rishi
  profileCard(
    name: 'Rishi Raj Singh',
    imagesrc: 'profile/rishi.jpeg',
    caption: randomCaption,
  ),
  //Shrey
  profileCard(
    name: 'Shrey',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Shristi
  profileCard(
    name: 'Shristi',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Rohit
  profileCard(
    name: 'Rohit',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
  //Goutam
  profileCard(
    name: 'Goutam Sree Govind',
    imagesrc: 'profile/goutam.jpg',
    caption: randomCaption,
  ),
  //Nomit
  profileCard(
    name: 'Nomit',
    imagesrc: randomCat,
    caption: randomCaption,
  ),
];

Card profileCard({String name, String imagesrc, String caption}) {
  return Card(
    color: cardColor,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imagesrc),
                radius: 70,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  caption,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Caveat', fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Card smallProfileCard({String name, String imagesrc, String caption}) {
  return Card(
    color: cardColor,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: CircleAvatar(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imagesrc),
              ),
              radius: 50,
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            caption,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontFamily: 'Caveat'),
          ),
        ],
      ),
    ),
  );
}
