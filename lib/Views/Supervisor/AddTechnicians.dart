

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomSupervisorDrawer.dart';



class AddTechnician extends StatefulWidget{
  @override
  State<AddTechnician> createState() => _AddTechnician  ();
}

class  _AddTechnician   extends State<AddTechnician >{
  @override
  //The instance to be injected
  bool _isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String _selectedDepartment = "Select Category";
  final selectedDepartmentList = [

    "Select Category",
    "Computer Science",
    'Staff',
    'Student',



  ];


  String _selectedBlock = "Select Category";
  final selectedBlockList = [
    "Select Category",
    "A","B","C"



  ];



  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomSupervisorDrawer(),
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey.shade100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [


                      Container(
                          margin: EdgeInsets.only(left:15.w,top:60.h),
                          width: MediaQuery.of(context).size.width-30,

                          color: Colors.white,

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,


                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 30.h, left: 24.w, bottom: 10.h),
                                      child:  Text(
                                        "Technicians",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context, builder: (context){
                                          return


                                            SizedBox(
                                              width: 300.h,
                                              child: AlertDialog(
                                                backgroundColor: Colors.white,
                                                shape:  RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                ),
                                                content: Container(
                                                  width: 350.w,
                                                  height: 330.h,

                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,

                                                    children: <Widget>[
                                                      Container(
                                                        width: 300.w,
                                                        height: 60.h,

                                                        child: Padding(
                                                          padding: EdgeInsets.only(left: 0, top: 20),
                                                          child: Text(
                                                            "Add/Save",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      //---------------TextFields------------//
                                                      Center(
                                                          child: SizedBox(
                                                              width: 300.w,
                                                              height: 45.h,
                                                              child: TextFormField(
                                                                style: TextStyle(color: Colors.black),

                                                                controller: nameController,
                                                                decoration: InputDecoration(label: Text("Name (Alphabets Only") ,

                                                                  border: OutlineInputBorder(),

                                                                ),))),
                                                      SizedBox(height: 10.w,),

                                                      Center(
                                                        child: Container(
                                                          width: 300.w,
                                                          height: 45.h,

                                                          child: TextFormField(
                                                            controller: emailController,
                                                            style: TextStyle(color: Colors.black),

                                                            decoration: InputDecoration(

                                                              label: Text("Email") ,

                                                              border: OutlineInputBorder(),
                                                            ),),
                                                        ),
                                                      ),


                                                      SizedBox(height: 10.h,),
                                                      Center(
                                                        child: Container(
                                                          width: 300.w,
                                                          height: 45.h,

                                                          child: TextFormField(
                                                            controller: passwordController,
                                                            style: TextStyle(color: Colors.black),

                                                            decoration: InputDecoration(

                                                              label: Text("Password") ,

                                                              border: OutlineInputBorder(),
                                                            ),),
                                                        ),
                                                      ),
                                                      SizedBox(height: 20.h,),

                                                      Divider(),





                                                      Padding(
                                                        padding:  EdgeInsets.only(left:180.w,top: 10.h),
                                                        child: Row(children: [

                                                          GestureDetector(
                                                            onTap:(){

                                                              Navigator.pop(context);

                                                            },


                                                            child: Padding(
                                                              padding: EdgeInsets.only(left: 0, top: 10),
                                                              child: Text(
                                                                "Close",
                                                                style: TextStyle(
                                                                  color: Colors.pink.shade400,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(width: 10.w,),

                                                          GestureDetector(
                                                              onTap:(){

                                                                Navigator.pop(context);

                                                              },


                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 0, top: 10),
                                                                child: Text(
                                                                  "Save",
                                                                  style: TextStyle(
                                                                    color: Colors.lightGreen.shade400,
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.w600,
                                                                  ),
                                                                ),
                                                              )),


                                                        ],),
                                                      )


                                                      // Add your other widgets here
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );


                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30.h, right: 10.w, bottom: 10.h),
                                        child:  Text(
                                          "ADD NEW ",
                                          style: TextStyle(
                                            color: Colors.deepPurpleAccent.shade200,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //--------1st Column
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [



                                        Padding(
                                          padding: EdgeInsets.only(top: 30.h, left: 24.w, ),
                                          child:  Text(
                                            "ID",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "NAME",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "EMAIL",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "PASSWORD",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w,bottom: 40.h ),
                                          child:  Text(
                                            "DESCRIPTION",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),






                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w,bottom: 40.h ),
                                          child:  Text(
                                            "ACTION",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),





                                      ],),



                                    Container(
                                      margin: EdgeInsets.only(top:30.h,left: 50.w),
                                      width: 1,
                                      height: 130.h,// Adjust the width to control the line thickness
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 20.w,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [



                                        Padding(
                                          padding: EdgeInsets.only(top: 30.h, left: 14.w, ),
                                          child:  Text(
                                            "120",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 14.w, ),
                                          child:  Text(
                                            "IBAD KARIMI",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 14.w, ),
                                          child:  Expanded(

                                            child: Text(
                                              "ibadkarimi.10@gmail.com",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 14.w, ),
                                          child:  Text(
                                            "123456",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w,bottom: 40.h ),
                                          child:  Text(
                                            "DESCRIPTION",
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),




                                        SizedBox(width: 10.w,),





                                          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,size: 20.sp,))







                                      ],),
                                  ],
                                )















                              ])),



                    ],),





                ),

                //---------------------Bottom theme


              ],
            )
        )
    );


  }}