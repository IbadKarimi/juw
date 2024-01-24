import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import"package:hovering/hovering.dart";
import 'package:juw/Views/Staff/Complaint.dart';
import 'package:juw/Views/Staff/DashBoard.dart';
import 'package:juw/Views/Staff/HeadToMain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Views/Staff/Profile.dart';
import '../Views/authentication/Login.dart';




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
  String? userName;

  void initState() {

    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());

    onLoad();


    super.initState();
  }

  onLoad()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName=prefs.getString("name");
      userEmail=prefs.getString("email");
    });


  }




  @override
  Widget build(BuildContext context) {

    return Drawer(

      backgroundColor: Colors.white,



      child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(child:
        Center(
          child:
          Column(
            children: [
              Center(
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  margin: EdgeInsets.only(right: 15.w),

                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("lib/images/avatars/avatar-1.png"),
                          fit: BoxFit.cover
                      ),

                      borderRadius: BorderRadius.circular(100.r)

                  ),

                ),
              ),
              Text(userName.toString()),
              Text(userEmail.toString(),style: TextStyle(fontWeight: FontWeight.w600),)

            ],
          ),
        ),),














        ListTile(
          leading: GestureDetector(onTap:(){
            Get.to(()=>StaffDashBoard());

          },
            child:Icon(Icons.home),),
          title: const Text('DashBoard',style: TextStyle(color: Colors.black),),
          onTap: () {

            Get.to(()=>StaffDashBoard());

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
            Get.offAll(()=>LoginFormWidget());

          },
              child: const Text('LogOut',style: TextStyle(color: Colors.black),)),
          onTap: () {
            Get.offAll(()=>LoginFormWidget());
            // Update the
            // state of the app.
            // ...
          },
        ),
      ],
    ),);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
