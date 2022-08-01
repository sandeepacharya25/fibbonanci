
import 'package:fibbonanci/models/our_product.dart';
import 'package:fibbonanci/models/our_service.dart';

import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';

import 'package:fibbonanci/widgets/bigText.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';


class ServiceList extends StatefulWidget {
  // final String listName;
  const ServiceList({ Key? key}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Select a product",
          style: TextStyle(
            color: AppColors.mainColor,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
          color:  AppColors.mainColor,
          
        ),
        //Icon(Icons.arrow_back_outlined,),
        actions: [
          Icon(Icons.search, color: AppColors.mainColor),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: Dimension.height15),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            itemCount: getServices().length,
            
            itemBuilder: (context, index) {
              print(getServices()[1]);
             return Container(
              height: 100,
              color: Colors.red,
             );
             //_buildServiceListItem(getServices()[index]);
              
              },
          ),
        ),
      ),
    );
  }
  // Widget _buildServiceListItem(ServiceList feed){
  //   return Container(
  //               height: Dimension.height20 * 5,
  //               width: double.maxFinite,
  //               child: Row(
  //                 children: [
  //                   GestureDetector(
  //                     onTap: () {},
  //                     child: Container(
  //                       width: Dimension.height20 * 5,
  //                       height: Dimension.height20 * 5,
  //                       margin: EdgeInsets.only(bottom: Dimension.height10),
  //                       decoration: BoxDecoration(
  //                           image: DecorationImage(
  //                             image: NetworkImage(
  //                              feed.,
  //                             ),
  //                             fit: BoxFit.cover,
  //                           ),
  //                           borderRadius:
  //                               BorderRadius.circular(Dimension.radius20),
  //                           color: Colors.white),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: Dimension.width10,
  //                   ),
  //                   Expanded(
  //                     child: Container(
  //                       height: Dimension.height20 * 5,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           BigText(
  //                             text: feed.name!,
  //                             color: Colors.black54,
  //                           ),
  //                           SmallText(text: "Spicy"),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             );
           
  // }
}
