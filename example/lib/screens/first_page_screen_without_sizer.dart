import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/constant.dart';
import '../util/strings.dart';

class FirstPageScreenWithoutSizer extends StatefulWidget {
  @override
  _FirstPageScreenWithoutSizerState createState() => _FirstPageScreenWithoutSizerState();
}

class _FirstPageScreenWithoutSizerState extends State<FirstPageScreenWithoutSizer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          widMainImg(),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              widTitle(),
              SizedBox(
                height: 20,
              ),
              widDesc()
            ],
          )),
        ],
      ),
    );
  }

  widMainImg() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Image.asset(Constant.IMG_1, height: MediaQuery.of(context).size.height/2),
    );
  }

  widTitle() {
    return Text(Strings.APP_NAME,
        style: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 35.0, color: Colors.black),
        ));
  }

  widDesc() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          Strings.APP_DESC,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(height: 1.3, fontSize: 15.0, color: Colors.grey),
          ),
        ));
  }
}
