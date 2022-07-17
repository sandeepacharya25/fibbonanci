// ignore_for_file: prefer_const_constructors

import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'bigText.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({ Key? key,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 5,left: 5),
      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: text,size: Dimension.font26,),
                      SizedBox(
                        height: Dimension.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => const Icon(
                                      Icons.star,
                                      color: AppColors.mainColor,
                                      size: 15,
                                    )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "4.5"),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "1287"),
                          const SizedBox(
                            width: 10,
                          ),
                          SmallText(text: "Comments"),
                        ],
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1,
                          ),
                          // SizedBox(width:5),
                          IconAndTextWidget(
                            icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor,
                          ),
                          // SizedBox(width:5),
                          IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            text: "32min",
                            iconColor: AppColors.iconColor2,
                          ),
                        ],
                      ),
                    ],
                  ),
    );
  }
}