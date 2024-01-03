import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import"package:hovering/hovering.dart";
import 'package:juw/Views/Staff/Complaint.dart';
import 'package:juw/Views/Staff/DashBoard.dart';
import 'package:juw/Views/Staff/HeadToMain.dart';

import '../Views/Staff/Profile.dart';




var picked;
String imagePath="";
String fullName="";
String phoneNo="";

class CustomDrawer extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _CustomDrawerState extends State<CustomDrawer> {




  String? userEmail;
  var user;







  void initState() {

    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());




    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Drawer(

      backgroundColor: Colors.white,



      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(child:    Center(
          child: Container(
            width: 100.w,
            height: 100.h,
            margin: EdgeInsets.only(right: 15.w),

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/images/avatars/avatar-1.png"),
                    fit: BoxFit.cover
                ),

                borderRadius: BorderRadius.circular(100.r)

            ),

          ),
        ),),











        SizedBox(height: 50.h,),


        ListTile(
          leading: GestureDetector(onTap:(){
            Get.to(()=>DashBoard());

          },
            child:Icon(Icons.home),),
          title: const Text('DashBoard',style: TextStyle(color: Colors.black),),
          onTap: () {

            Get.to(()=>DashBoard());

          },
        ),

      HoverContainer(

        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.shade100,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),

            )
        ),
        hoverDecoration:   BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),

            )
        ),),
        ListTile(
            leading: GestureDetector(onTap:(){
              Get.to(()=>Complaint());

            },
              child:Icon(Icons.comment_bank_outlined),),
            title: const Text('Complaint',style: TextStyle(color: Colors.black),),
            onTap: () {
              Get.to(()=>Complaint());
            },
          ),
        ListTile(
          leading: Icon(Icons.person),
          title: GestureDetector(onTap:(){
            Get.to(()=>Profile());

          },
              child: const Text('Profile',style: TextStyle(color: Colors.black),)),
          onTap: () {
            Get.to(()=>Profile());
          },
        ),

        ListTile(
          leading: GestureDetector(onTap:(){
            Get.to(()=>HeadToMail());

          },
            child:Icon(Icons.mail_rounded),),
          title: const Text('Mail to Head',style: TextStyle(color: Colors.black),),
          onTap: () {

            Get.to(()=>HeadToMail());

          },
        ),
        ListTile(
          leading: Icon(Icons.login_rounded),
          title: GestureDetector(onTap:(){

          },
              child: const Text('LogOut',style: TextStyle(color: Colors.black),)),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
