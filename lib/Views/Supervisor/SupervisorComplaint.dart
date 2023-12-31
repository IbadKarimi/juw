

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomSupervisorDrawer.dart';
import 'dart:io';



class SupervisorComplaint extends StatefulWidget{
  @override
  State< SupervisorComplaint  > createState() => _SupervisorComplaint ();
}

class _SupervisorComplaint   extends State< SupervisorComplaint >{
  @override
  //The instance to be injected
  bool _isLoading = false;
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  String _selectedDepartment = "Select Category";
  DateTime? selectedDate;
  String formattedSelectedDate = '';

  DateTime? selectedDateTime;
  String formattedSelectedDateTime = '';


  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );




      if (pickedDate != null) {
        DateTime combinedDateTime = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, );
        setState(() {
          selectedDateTime = combinedDateTime;
         // formattedSelectedDateTime = DateFormat('dd/MM/yyyy hh:mm a').format(combinedDateTime);


        });
      }

  }
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
                                        "Complaints",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
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
                                            "COMPLAINT BY",
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
                                            "TITLE",
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
                                            "TECHNICIAN",
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
                                            "STATUS",
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
                                            "CREATED AT",
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
                                            "RESOLVE AT",
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
                                      height: 390.h,// Adjust the width to control the line thickness
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 20.w,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [



                                        Padding(
                                          padding: EdgeInsets.only(top: 30.h, left: 24.w, ),
                                          child:  Text(
                                            "ID",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "COMPLAINT BY",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "TITLE",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "TECHNICIAN",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "STATUS",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w, ),
                                          child:  Text(
                                            "CREATED AT",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 24.w,bottom: 0.h ),
                                          child:  Text(
                                            "RESOLVE AT",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Row(children: [
                                          SizedBox(width: 10.w,),
                                          //--Icons eyee
                                          IconButton(onPressed: (){
                                            showDialog(context: context, builder: (context){
                                              return
                                                AlertDialog(

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
                                                            "elec",
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

                                                      SizedBox(height: 10.w,),

                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0, top: 10),
                                                        child: Text(
                                                          "CCTV Camera",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),




                                                      SizedBox(height: 10.h,),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0, top: 10),
                                                        child: Text(
                                                          "CCTV repair install and trouble shooting",
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0, top: 10),
                                                        child: Text(
                                                          "Description",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18.sp,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),



                                                      Padding(
                                                        padding: EdgeInsets.only(left: 0, top: 10),
                                                        child: Text(
                                                          "xyz",
                                                          style: TextStyle(
                                                            color: Colors.black38,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 20.h,),

                                                      Divider(),





                                                      Padding(
                                                        padding:  EdgeInsets.only(left:0.w,top: 10.h),
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
                                                                  color: Colors.amberAccent,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(width: 10.w,),




                                                        ],),
                                                      )


                                                      // Add your other widgets here
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });


                                          }, icon: Icon(Icons.remove_red_eye,color: Colors.amber,size: 20.sp,)),


                                          IconButton(onPressed: (){
                                            showDialog(context: context, builder: (context){
                                              return
                                                AlertDialog(

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
                                                            "Assign Technician",
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(),
                                                      //---------------CALEMDER------------//
                                                      GestureDetector(
                                                        onTap: (){
                                                          _pickDate();
                                                        },
                                                        child: Container(
                                                            width: 300.w,
                                                            height: 50.h,

                                                            margin: EdgeInsets.only(top:0.h,left:0.w),
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5.r),
                                                              border: Border.all(color: Colors.grey, width: 1),


                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:  EdgeInsets.only(left:5.w),
                                                                  child: Icon(Icons.calendar_month),
                                                                ),
                                                                Padding(
                                                                  padding:  EdgeInsets.only(left:5.w), child:Text( selectedDateTime.toString(),style: TextStyle(color: Colors.black,),),)
                                                              ],
                                                            )

                                                        ),
                                                      ),

                                                      SizedBox(height: 10.w,),

                                                      Container(
                                                          width: 300.w,

                                                          margin:  EdgeInsets.only(top: 10.h,left:0.w),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(color: Colors.black38, width: 1),
                                                              borderRadius: BorderRadius.circular(5.r),
                                                              boxShadow: <BoxShadow>[]),
                                                          child: DropdownButtonHideUnderline(
                                                              child: DropdownButtonFormField(
                                                                value:_selectedDepartment,
                                                                items: selectedDepartmentList.map((e) {
                                                                  return DropdownMenuItem<String>(
                                                                      child:
                                                                      Padding(
                                                                        padding:  EdgeInsets.only(left:2.0),
                                                                        child: Text(e,style: TextStyle(color: Colors.black),),
                                                                      ), value: e);
                                                                }).toList(),
                                                                onChanged: (newValue) {
                                                                  setState(() {
                                                                    _selectedDepartment = newValue as String;

                                                                  });
                                                                },
                                                                isExpanded: true,
                                                              ))),












                                                      SizedBox(height: 20.h,),

                                                      Divider(),





                                                      Padding(
                                                        padding:  EdgeInsets.only(left:140.w,top: 10.h),
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
                                                                "Assign",
                                                                style: TextStyle(
                                                                  color: Colors.green,
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),




                                                        ],),
                                                      )


                                                      // Add your other widgets here
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });

                                          }, icon: Icon(Icons.person,color: Colors.green,size: 20.sp,)),

                                          IconButton(onPressed: (){
                                            showDialog(context: context, builder: (context){
                                              return
                                                AlertDialog(

                                              shape:  RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              ),
                                              content: Container(
                                              width: 350.w,
                                              height: 250.h,


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
                                              "Request Extended Date",
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

    SizedBox(height: 10.w,),







    Padding(
    padding: EdgeInsets.only(left: 0, top: 10),
    child: Text(
    "Technician requested to extend deadline date",
    style: TextStyle(
    color: Colors.black38,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),

    Padding(
    padding: EdgeInsets.only(left: 0, top: 10),
    child: Text(
    "Requested Date :2023-12-10",
    style: TextStyle(
    color: Colors.black38,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    SizedBox(height: 20.h,),

    Divider(),





    Padding(
    padding:  EdgeInsets.only(left:0.w,top: 10.h),
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
    color: Colors.amber,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    ),
    ),
    ),
    ),

    SizedBox(width: 185.w,),
      GestureDetector(
        onTap:(){

          Navigator.pop(context);

        },


        child: Padding(
          padding: EdgeInsets.only(left: 0, top: 10),
          child: Text(
            "Reject",
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
            "Accept",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),




    ],),
    )


    // Add your other widgets here
    ],
    ),
    ),
    );
    });



                                          }, icon: Icon(Icons.notifications_active_outlined,color: Colors.blue,size: 20.sp,)),


                                        ],),


                                        IconButton(onPressed: (){



                                        }, icon: Icon(Icons.delete,color: Colors.red,size: 20.sp,)),





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