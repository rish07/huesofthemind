import 'package:flutter/material.dart';
import 'package:hues/utilities/constants.dart';
import 'package:hues/utilities/responsive_widget.dart';
import 'package:hues/widgets/custom_button.dart';

class Outreach extends StatefulWidget {
  @override
  _OutreachState createState() => _OutreachState();
}

class _OutreachState extends State<Outreach> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  height: 26,
                  width: 20,
                  child: VerticalDivider(
                    width: 2,
                    thickness: 4,
                    color: yellowColor,
                  ),
                ),
                Text(
                  'About our ',
                  style: TextStyle(
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Outreach',
                  style: TextStyle(
                    color: yellowColor,
                    fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.12,
              ),
              child: Text(
                "About 19% of adults, 46% of teenagers and 13% of the child population become victims of mental illness every year. The annual suicide rate is 13.42 per 100,000 individuals. These statistics are not mere numbers, they highlight the mental state of people and how important it is to hold a healthy discussion about mental health to break the stigma. Through our outreach programs, we intend to lead the way in raising awareness of mental health and elevate an important topic that needs greater attention.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ResponsiveWidget.isLargeScreen(context) ? 24 : 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            customButton(
              title: 'Click here to sign up!',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
