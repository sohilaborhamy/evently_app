
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_app.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
     scaffoldBackgroundColor: ColorsApp.primaryColorLight,
      appBarTheme:const  AppBarTheme(color: ColorsApp.primaryColorLight),
     textTheme: GoogleFonts.interTextTheme(),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsApp.primaryColorDark,
    appBarTheme:const  AppBarTheme(color: ColorsApp.primaryColorDark),
    textTheme: GoogleFonts.interTextTheme(
      
     
    ),
  
  );
}
