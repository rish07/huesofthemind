import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

const String randomCaption =
    "'This is a random caption to check how it looks. I never thought writing a random caption would be this hard. I cant even think what to write'";

const String randomCat = 'profile/cat.jpeg';
List<Widget> profilesSmallScreen = [
  //Manasi
  smallProfileCard(
      name: 'Manasi',
      imagesrc: 'profile/manasi.jpg',
      caption:
          "Huesofthemind is a safe space, a place to empower each other. I founded this organisation a year ago and I couldn’t be more proud of all that we as a team have achieved and provided to the society. To lots of more positivity, understanding and joy!"),
  //Lavanya
  smallProfileCard(
    name: 'Lavanya',
    imagesrc: 'profile/lava.JPG',
    caption:
        "This page means a lot to me. It has become my coping mechanism and always lets the ray of positivity in me. I don't know what else to say. It just means a lot to me",
  ),

  //Rishi
  smallProfileCard(
    name: 'Rishi',
    imagesrc: 'profile/rishi.jpeg',
    caption:
        "I've always wanted to share what's going on in my mind without being judged. Huesofthemind is a similar platform, it's my #safeplace",
  ),

  //Shrey
  smallProfileCard(
    name: 'Shrey',
    imagesrc: randomCat,
    caption:
        "Huesofthemind has inspired and motivated me to become a better person with each passing day.",
  ),
  //Kinnari
  smallProfileCard(
    name: 'Kinnari',
    imagesrc: 'profile/kin.JPG',
    caption: "Let's help each other grow, one day at a time :)",
  ),

  //Shristi
  smallProfileCard(
      name: 'Shristi',
      imagesrc: 'profile/shristi.jpg',
      caption:
          "All it takes is a simple question to open the doors to potentially saving someone’s life. HOTM is a platform for you to express, to cry, to laugh, to simply, talk."),
  //Rohit
  smallProfileCard(
    name: 'Rohit',
    imagesrc: 'profile/rohit.jpg',
    caption:
        "I am another 18 year old boy trying to figure out things and I believe that words combined with appropriate visuals can make a huge impact on the world.",
  ),

  //Goutam
  smallProfileCard(
    name: 'Goutam',
    imagesrc: 'profile/goutam.jpg',
    caption:
        "Huesofthemind is a place for me to  do more than just design, it lets me spread happiness! I love the warm and positive vibe of our team because it matches my own. 😄",
  ),

  //Nomit
  smallProfileCard(
      name: 'Nomit',
      imagesrc: 'profile/nomit.jpg',
      caption: "Exploring ourselves and spreading courage along the way 🤸‍♂️")
];

List<Widget> profilesNormal = [
  //Manasi
  profileCard(
      name: 'Manasi',
      imagesrc: 'profile/manasi.jpg',
      caption:
          "Huesofthemind is a safe space, a place to empower each other. I founded this organisation a year ago and I couldn’t be more proud of all that we as a team have achieved and provided to the society. To lots of more positivity, understanding and joy!"),
  //Lavanya
  profileCard(
    name: 'Lavanya',
    imagesrc: 'profile/lava.JPG',
    caption:
        "This page means a lot to me. It has become my coping mechanism and always lets the ray of positivity in me. I don't know what else to say. It just means a lot to me",
  ),
  //Rishi
  profileCard(
    name: 'Rishi',
    imagesrc: 'profile/rishi.jpeg',
    caption:
        "I've always wanted to share what's going on in my mind without being judged. Huesofthemind is a similar platform, it's my #safeplace",
  ),
  //Shrey
  profileCard(
    name: 'Shrey',
    imagesrc: randomCat,
    caption:
        "Huesofthemind has inspired and motivated me to become a better person with each passing day.",
  ),
  //Kinnari
  profileCard(
    name: 'Kinnari',
    imagesrc: 'profile/kin.JPG',
    caption: "Let's help each other grow, one day at a time :)",
  ),
  //Shristi
  profileCard(
      name: 'Shristi',
      imagesrc: 'profile/shristi.jpg',
      caption:
          "All it takes is a simple question to open the doors to potentially saving someone’s life. HOTM is a platform for you to express, to cry, to laugh, to simply, talk."),
  //Rohit
  profileCard(
    name: 'Rohit',
    imagesrc: 'profile/rohit.jpg',
    caption:
        "I am another 18 year old boy trying to figure out things and I believe that words combined with appropriate visuals can make a huge impact on the world",
  ),
  //Goutam
  profileCard(
    name: 'Goutam',
    imagesrc: 'profile/goutam.jpg',
    caption:
        "Huesofthemind is a place for me to  do more than just design, it lets me spread happiness! I love the warm and positive vibe of our team because it matches my own. 😄",
  ),
  //Nomit
  profileCard(
      name: 'Nomit',
      imagesrc: 'profile/nomit.jpg',
      caption: "Exploring ourselves and spreading courage along the way 🤸‍♂️"),
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
                AutoSizeText(
                  name,
                  maxLines: 1,
                  style: TextStyle(fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  caption,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Satisfy', fontSize: 25),
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
          AutoSizeText(
            name,
            maxLines: 1,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          AutoSizeText(
            caption,
            maxLines: 5,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Satisfy',
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  );
}
