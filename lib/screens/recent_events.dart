import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hues/utilities/constants.dart';



class RecentEvents extends StatefulWidget {
  @override
  _RecentEventsState createState() => _RecentEventsState();
}

class _RecentEventsState extends State<RecentEvents> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child :  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:size.width*0.01,vertical: size.height/(1200/80),),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 26,
                  child: VerticalDivider(

                    thickness: 3,
                    color: yellowColor,
                  ),
                ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: size.width*0.001),
                 child: Text('Recent Events',
                   style: TextStyle(fontWeight: FontWeight.bold,
                     fontSize: 16,
                   ),
                 ),
               ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
