

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juw/widgets/CustomAppBar.dart';

import '../../widgets/CustomDrawer.dart';

class Complaint extends StatefulWidget{
  @override
  State< Complaint  > createState() => _Complaint  ();
}

class _Complaint   extends State< Complaint >{
  @override
  //The instance to be injected
  bool _isLoading = false;
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController roomController=TextEditingController();
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
        drawer: CustomDrawer(),
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
                                height: 460.h,

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

                                    controller: titleController,
                                    decoration: InputDecoration(label: Text("Title") ,

                                      border: OutlineInputBorder(),

                                    ),))),

                                    //--Drop down

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
                                                      padding:  EdgeInsets.only(left:10.0),
                                                      child: Text(e,style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12.sp,
                                                      ),),
                                                    ), value: e);
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedDepartment = newValue as String;

                                                });
                                              },
                                              isExpanded: true,
                                            ))),

                                    SizedBox(width: 10.w,),
                                    Container(
                                        width: 300.w,

                                        margin:  EdgeInsets.only(top: 10.h,left:0.w),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black38, width: 1),
                                            borderRadius: BorderRadius.circular(5.r),
                                            boxShadow: <BoxShadow>[]),
                                        child: DropdownButtonHideUnderline(
                                            child: DropdownButtonFormField(
                                              value: _selectedBlock,
                                              items: selectedBlockList.map((e) {
                                                return DropdownMenuItem<String>(
                                                    child:
                                                    Padding(
                                                      padding:  EdgeInsets.only(left:10.w),
                                                      child: Text(e,style: TextStyle(color: Colors.black,fontSize: 14.sp),),
                                                    ), value: e);
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedBlock = newValue as String;

                                                });
                                              },
                                              isExpanded: true,
                                            ))),
                                    SizedBox(height: 10.h,),
                                    SizedBox(
                                        width: 300.w,
                                        height: 45.h,
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),

                                          controller: roomController,
                                          decoration: InputDecoration(label: Text("Room No") ,

                                            border: OutlineInputBorder(),

                                          ),)),
                                    SizedBox(height: 10.h,),
                                    Container(
                                      width: 300.w,
                                      height: 80.h,
                                      child: TextFormField(
                                        maxLines: 4, // Adjust the number of lines as needed
                                        decoration: InputDecoration(
                                          hintText: 'Description',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),

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
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "TITLE",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "TECHNICIAN",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "STATUS",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "CREATED AT",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "RESOLVE AT",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w,bottom: 40.h ),
                        child:  Text(
                          "ACTION",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18.sp,
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
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "TITLE",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "TECHNICIAN",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "STATUS",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w, ),
                        child:  Text(
                          "CREATED AT",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 40.h, left: 24.w,bottom: 20.h ),
                        child:  Text(
                          "RESOLVE AT",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),


                     Row(children: [
                       SizedBox(width: 10.w,),
                       IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye,color: Colors.amber,)),
                       IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))

                     ],)





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