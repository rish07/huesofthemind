import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String randomCaption =
    "'This is a random caption to check how it looks. I never thought writing a random caption would be this hard. I cant even think what to write'";

const String randomCat = 'profile/cat.jpeg';
List<Widget> profilesSmallScreen = [
  //Manasi
  smallProfileCard(
      name: 'Manasi',
      imagesrc: 'profile/manasi.jpg',
      caption:
          "Huesofthemind is a safe space, a place to empower each other. I founded this organisation a year ago and I couldn’t be more proud of all that we as a team have achieved and provided to the society."),

  //Rishi
  smallProfileCard(
    name: 'Rishi',
    imagesrc: 'profile/rishi.jpeg',
    caption:
        "I've always wanted to share what's going on in my mind without being judged. Huesofthemind is a similar platform, it's my #safeplace",
  ),

  //Drashti
  smallProfileCard(
    name: 'Drashti',
    imagesrc: 'profile/drashti.jpg',
    caption:
        "Living in a million alternate realities rather than this reality, I guess that's why I have hope every time I wake up",
  ),
  //Pranavi
  smallProfileCard(
      name: 'Pranavi',
      imagesrc: 'profile/pranavi.jpeg',
      caption:
          "Sky is an embodiment of everything from bright suns to Heavy rains. Huesofthemind, a sky-like safe space, is one of the guiding lights for me and a whole big community to learn together to learn about ourselves."),

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
];

List<Widget> profilesNormal = [
  //Manasi
  profileCard(
      name: 'Manasi',
      imagesrc: 'profile/manasi.jpg',
      caption:
          "Huesofthemind is a safe space, a place to empower each other. I founded this organisation a year ago and I couldn’t be more proud of all that we as a team have achieved and provided to the society. To lots of more positivity, understanding and joy!"),

  //Rishi
  profileCard(
    name: 'Rishi',
    imagesrc: 'profile/rishi.jpeg',
    caption:
        "I've always wanted to share what's going on in my mind without being judged. Huesofthemind is a similar platform, it's my #safeplace",
  ),
  //Drashti
  profileCard(
    name: 'Drashti',
    imagesrc: 'profile/drashti.jpg',
    caption:
        "Living in a million alternate realities rather than this reality, I guess that's why I have hope every time I wake up",
  ),
  //Pranavi
  profileCard(
      name: 'Pranavi',
      imagesrc: 'profile/pranavi.jpeg',
      caption:
          "Sky is an embodiment of everything from bright suns to Heavy rains. Huesofthemind, a sky-like safe space, is one of the guiding lights for me and a whole big community to learn together to learn about ourselves."),

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
];

Card profileCard({String name, String imagesrc, String caption}) {
  return Card(
    color: Colors.white,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Image.asset(
              imagesrc,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      name,
                      maxLines: 1,
                      style: TextStyle(fontSize: 40),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 35,
                        width: 35,
                        child: Image.asset('insta.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  caption,
                  textAlign: TextAlign.justify,
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
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
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
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              AutoSizeText(
                caption,
                maxLines: 6,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Satisfy',
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 27,
                  width: 27,
                  child: Image.asset('insta.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
