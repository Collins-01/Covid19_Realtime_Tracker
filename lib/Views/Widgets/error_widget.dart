import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class Error extends StatelessWidget {
  final String title;
  final Function function;
  Error({@required this.title, @required this.function});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title.toUpperCase(), style: GoogleFonts.ubuntu()),
          SizedBox(
            height: 10,
          ),
          FlatButton.icon(
              color: Colors.pink,
              onPressed: function,
              icon: Icon(LineIcons.refresh),
              label: Text("Refresh"))
        ],
      ),
    ));
  }
}
