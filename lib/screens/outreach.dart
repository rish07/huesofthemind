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
                horizontal: size.width * 0.15,
              ),
              child: Text(
                "Uria de ferox classis, vitare lixa! Not over there or zion, absorb the definition. For a tangy sun-dried sauce, add some gold tequila and black cardamon. Jumble the ginger with tangy radish sprouts, vodka, szechuan pepper, and basil making sure to cover all of it. Spacecrafts die from galaxies like human planets.",
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
