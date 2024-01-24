

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomSupervisorDrawer.dart';

import '../../ApiServices/Api.dart';
import '../../Models/UserModel.dart';



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
  ApiServices apiService=ApiServices();
  List<UserModel> getTechnicianData=[];
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
void initState(){

  apiService.getTechnician().then((value){
    setState(() {
      getTechnicianData.addAll(value);
    });

    for(int i=0;i<getTechnicianData.length;i++){
      print("name is ==========="+getTechnicianData[i].name.toString());
    }
  });


  super.initState();
}


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

                                //add new and Tecnicans
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
                                                        padding:  EdgeInsets.only(left:120.w,top: 10.h),
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
                                                              onTap:()async{

                                                                  String response=await apiService.userSignUp(nameController.text,
                                                                      emailController.text,
                                                                      passwordController.text, "technician", "", "", "");
                                                                  if(response=="200"){
                                                                   Navigator.push(context, MaterialPageRoute(builder: (context){
                                                                     return AddTechnician();
                                                                   }));
                                                                  }







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
                                for(int i=0;i<getTechnicianData.length;i++)
                                Column(


                                  children: [
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
                                                  fontSize: 12.sp,
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
                                                  fontSize: 12.sp,
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
                                                  fontSize: 12.sp,
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
                                                  fontSize: 12.sp,
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
                                          margin: EdgeInsets.only(top:30.h,left: 10.w),
                                          width: 1,
                                          height: 130.h,// Adjust the width to control the line thickness
                                          color: Colors.grey,
                                        ),//linr vertical
                                        SizedBox(width: 20.w,),


                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [



                                            Padding(
                                              padding: EdgeInsets.only(top: 30.h, left: 5.w, ),
                                              child:  Text(
                                                getTechnicianData[i].id.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),

                                            Padding(
                                              padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                              child:  Text(
                                                getTechnicianData[i].name.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),

                                            Container(

                                              width: 170.w,
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                                child:  Text(
                                                  getTechnicianData[i].email.toString(),
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),


                                            Padding(
                                              padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                              child:  Text(
                                                getTechnicianData[i].password.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 10.h, left: 5.w,bottom: 40.h ),
                                              child:  Text(
                                                getTechnicianData[i].description.toString(),
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),




                                            SizedBox(width: 10.w,),





                                              IconButton(onPressed: ()async{

                                           print(getTechnicianData[i].id);

                                                String? response=await apiService.deleteTechnician(getTechnicianData[i].id!);

                                              if(response=="200"){
                                                setState(() {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                    return AddTechnician();
                                                  }));
                                                });

                                                }

                                              }, icon: Icon(Icons.delete,color: Colors.red,size: 20.sp,))







                                          ],),
                                      ],
                                    ),
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