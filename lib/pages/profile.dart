import 'package:fibbonanci/utils/colors.dart';
import 'package:fibbonanci/utils/dimensions.dart';
import 'package:fibbonanci/widgets/bigText.dart';
import 'package:fibbonanci/widgets/smallText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    List profile=[
      'Edit Profile',
      'Change Password',
      'Reward Points',
      'Rate & Review',
      'Privacy Policy',
      'Terms and Conditions',
      'Contact Us',
    ];
    return Scaffold(
      backgroundColor: 
      // Colors.white,
      AppColors.buttonBackgroundColor,
      appBar: AppBar(
        title: Text("My Profile",
        style: GoogleFonts.poppins(
          color: Colors.black
        ),
        ),
        backgroundColor:AppColors.buttonBackgroundColor,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,
        color: Colors.black,
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                child: Icon(Icons.supervised_user_circle_sharp,),
                radius:50,
                
              ),
              Text("Priya Karki",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
              ),
              ),
              Text("98152566452"),
              SizedBox(height:40),
              ListView.builder(
                // padding: EdgeInsets.only(bottom: Dimension.height30),
                itemCount: profile.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>buildListTile(profile[index])),
                SizedBox(height: Dimension.height45,),
                SmallText(text: "V1.01"),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildListTile(String text){
    return Container(
      margin: EdgeInsets.only(top: Dimension.height10),
      padding: EdgeInsets.all(Dimension.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimension.radius15),
        color: Colors.white
      ),
      child: ListTile
      (
        // minVerticalPadding: Dimension.height30,
        // contentPadding: EdgeInsets.all(Dimension.height10),
        title: SmallText(
          text: text,
          color: Colors.black,
          size: 16,
        ),
        // title: Text(text,
        // style: GoogleFonts.poppins(
        //   textStyle: TextStyle(),
        // ),
        // // style: TextStyle(
        // //   font
        // // ),
        
        // ),
        // trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}