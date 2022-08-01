
import 'package:fibbonanci/models/our_product.dart';

import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';

import 'package:fibbonanci/widgets/bigText.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';


class ProductList extends StatefulWidget {
  // final String listName;
  const ProductList({ Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
            itemCount: getFeeds().length,
            
            itemBuilder: (context, index) {
             return _buildListItem(getFeeds()[index]);
              
              },
          ),
        ),
      ),
    );
  }
  Widget _buildListItem(Feed feed){
    return Container(
                height: Dimension.height20 * 5,
                width: double.maxFinite,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: Dimension.height20 * 5,
                        height: Dimension.height20 * 5,
                        margin: EdgeInsets.only(bottom: Dimension.height10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                               feed.image! ,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: Dimension.width10,
                    ),
                    Expanded(
                      child: Container(
                        height: Dimension.height20 * 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: feed.name!,
                              color: Colors.black54,
                            ),
                            SmallText(text: "Spicy"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
           
  }
}
