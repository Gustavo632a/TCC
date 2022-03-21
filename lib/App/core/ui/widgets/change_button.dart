import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget{
  
  final VoidCallback? onPressed;
  final String label;
  final double? width;
  final double? height;
  final Color? color;

  const ChangeButton ({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          ),

          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), 
            primary: Color.fromRGBO(0, 150, 255, 100)
          ),
        ),
    );
  }
}