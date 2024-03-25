 import 'package:flutter/material.dart';

final darkTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.amber),
        dividerColor: Colors.white10,
        appBarTheme:const AppBarTheme(
          iconTheme: IconThemeData(color:Colors.white),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(
            color:Colors.white,
            fontSize:20,
            fontWeight: FontWeight.w700,
          ),
          ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        textTheme:  TextTheme(
         bodyMedium:   const TextStyle(
              color:Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              ),
        labelSmall: TextStyle(
              color:Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w500,
              fontSize: 16,
              ),
        ),
      );