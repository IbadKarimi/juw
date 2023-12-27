import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import"package:hovering/hovering.dart";




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

    return Drawer( child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [









SizedBox(height: 50.h,),


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
          ),
          child: ListTile(
            leading: GestureDetector(onTap:(){

            },
              child:Icon(Icons.home),),
            title: const Text('DashBoard',style: TextStyle(color: Colors.black),),
            onTap: () {

            },
          ),
        ),

      HoverContainer(

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),

            )
        ),
        hoverDecoration:   BoxDecoration(
            color: Colors.deepPurpleAccent.shade100,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),

            )
        ),),
        ListTile(
            leading: GestureDetector(onTap:(){

            },
              child:Icon(Icons.comment_bank_outlined),),
            title: const Text('Complaint',style: TextStyle(color: Colors.black),),
            onTap: () {

            },
          ),
        ListTile(
          leading: Icon(Icons.person),
          title: GestureDetector(onTap:(){

          },
              child: const Text('Profile',style: TextStyle(color: Colors.black),)),
          onTap: () {
            // Update the state of the app.
            // ...
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
