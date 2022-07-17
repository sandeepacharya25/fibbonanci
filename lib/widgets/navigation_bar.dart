import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fibbonanci/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'app_icon.dart';

class NavigationBarWidgets extends StatefulWidget {
  const NavigationBarWidgets({ Key? key }) : super(key: key);

  @override
  State<NavigationBarWidgets> createState() => _NavigationBarWidgetsState();
}

class _NavigationBarWidgetsState extends State<NavigationBarWidgets> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white38,
        items: <Widget>[
          // Icon(
          //   Icons.home,
          //   size: 30,
          //   color: Colors.green[400],
          // ),
           AppIcon(icon: Icons.home,
        //  size: Dimension.iconSize24*2,
         iconSize: Dimension.iconSize24*1.5,
         iconColor: AppColors.mainColor,

         ),

          // Icon(
          //   Icons.medication,
          //   size: 30,
          //   color: Colors.green[400],
          // ),
           AppIcon(icon: Icons.shopping_bag,
        //  size: Dimension.iconSize24*2,
         iconSize: Dimension.iconSize24*1.5,
         iconColor: AppColors.mainColor,

         ),
          // RawMaterialButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Emergency()));
          //   },
          //   elevation: 2.0,
          //   fillColor: Colors.red,
          //   child:Text("E",
          //   style: GoogleFonts.poppins(
          //     fontWeight:FontWeight.bold,
          //     color: Colors.white,
          //     fontSize: 30
          //   ),
          //   ),
          //   //  Icon(
          //   //   Icons.add,
          //   //   size: 40.0,
          //   //   color: Colors.white,
          //   // ),
          //   padding: EdgeInsets.all(15.0),
          //   shape: CircleBorder(),
          // // ),

         
         AppIcon(icon: Icons.search,
        //  size: Dimension.iconSize24*2,
         iconSize: Dimension.iconSize24*1.5,
         iconColor: AppColors.mainColor,

         ),
          // Icon(
          //   Icons.bloodtype,
          //   size: 30,
          //   color: Colors.green,
          // ),
           AppIcon(icon: Icons.person,
       
         iconSize: Dimension.iconSize24*1.5,
         iconColor: AppColors.mainColor,

         ),
          // Icon(
          //   Icons.person,
          //   size: 30,
          //   color: Colors.green[400],
          // ),
        ],
        // onTap: (index) {
        //   _onItemTapped(index);
        // },
      );
  }
}