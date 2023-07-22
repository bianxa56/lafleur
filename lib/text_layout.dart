import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TextLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'ABOUT US',
            style: GoogleFonts.quicksand(
              fontSize: 30,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 8.0), // Added SizedBox to control spacing
          Text(
            'One of the most interesting things about flowers is they are used to express a message from the giver. In the 1800s, mastering the meanings behind flowers became a popular pastime.\n\n'
            'La Fleur is an online gallery for plant enthusiasts as well as for those who love to discover the captivating world of flowers.'
            ' Dive into a treasure trove of botanical wonders, exploring their names, taxonomy, and enchanting descriptions.'
            ' Immerse yourself in the beauty of nature as each flower unfolds its unique story, revealing its kingdom, genus, family, and captivating details.\n\n',
            style: GoogleFonts.quicksand(
              fontSize: 18,
            ),
          ),
          Divider(),
          RichText(
            text: TextSpan(
              text: 'The Team: Vanica Cabrillos | Bianca Amor Mazarate',
              style: TextStyle(
                fontSize: 17,
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
