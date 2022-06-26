// ignore: file_names
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class BigText extends StatelessWidget {
 Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  BigText({ Key? key, 
  this.color=const Color(0xFF332d2b),
  required this.text ,
  this.overFlow=TextOverflow.ellipsis,
  this.size=0,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style:TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: size==0?Dimension.font20:size,
      ),
      maxLines: 1,
      
    );
  }
}