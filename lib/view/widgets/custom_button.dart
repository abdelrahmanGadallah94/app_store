import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Color buttonColor;
  Color textColor;
  String text;
  Function()? onPressed;
   CustomButton({Key? key,required this.buttonColor,required this.text,required this.textColor,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text,style: TextStyle(fontSize: 18,color: textColor),),
      ),
    );
  }
}
