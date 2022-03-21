import 'package:flutter/material.dart';

class ChangeAppbar extends AppBar{
  ChangeAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
    key: key,
    backgroundColor: Colors.white,
    elevation: elevation,
    centerTitle: true,
    title: Image.asset('assets/images/Change-logo.png',
    width: 200,
    height: 200,
    ),
    iconTheme: const IconThemeData(color: Colors.black)
  );
}