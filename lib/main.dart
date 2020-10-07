import 'package:first_flutter_app/parsing_json/json_parsing.dart';
import 'package:first_flutter_app/parsing_json/json_parsing_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/home.dart';

/*void main() =>runApp(ScaffoldExample());*/

//Theming-Over-Writing theme Properties
final ThemeData _appTheme = _buildAppTheme();

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.white,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.lightBlueAccent,
    backgroundColor: Colors.amber,
    textTheme:_appTextTheme(base.textTheme)
  );
}

TextTheme _appTextTheme(TextTheme base){
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500
    ),
    title: base.title.copyWith(
      fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,

    ),

    button: base.button.copyWith(
      /*letterSpacing: 3.0,
          fontSize: 23.9,
        backgroundColor: Colors.red*/
      //how to add custom fonts
      fontFamily: "Lobster",
    ),

    body1: base.body1.copyWith(
        fontSize: 17,
        //how to add custom fonts using assets in yaml file
        /*fontFamily: "Lobster",*/
        color: Colors.white,

    )
  ).apply(
    /*fontFamily: "Lobster",*/
    displayColor: Colors.black,
    bodyColor: Colors.black26
    //bodyColor: Colors.black
  );

}

void main() =>runApp( new MaterialApp(
  //theme in flutter (important)
  theme: _appTheme,

  /*theme: ThemeData(
   // brightness: Brightness.light, //this is default light theme
    brightness: Brightness.dark,
    primaryColor: Colors.grey[800],

    textTheme: TextTheme(
      headline: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold
      ),
      body1: TextStyle(
        fontSize: 17,
        color: Colors.white
      )
    )
  ),*/
  home: JsonParsingMap(),
));

