

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:juw/ApiServices/Api.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Profile extends StatefulWidget{
  @override
  State<Profile > createState() => _Profile ();
}

class _Profile  extends State<Profile>{
  @override
  //The instance to be injected
  bool _isLoading = false;

  final _formKey=GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: "Ibad Karimi");
  final TextEditingController emailController = TextEditingController(text: "ibadkarimi.10@gmail.com");
  final TextEditingController officeNoController = TextEditingController(text: "03425949630");
  final TextEditingController passwordController = TextEditingController(text:"@12123213");
  String? names="asad";
  var name,email,password,officeNumber,block,department;
  int ? userId;

  void initState() {

    // var ownerAbout=getOwnerAbout(currentUserEmail.toString());

    onLoad();


    super.initState();
  }

  onLoad()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name=prefs.getString("name");
      email=prefs.getString("email");
      password=prefs.getString("password");
      block=prefs.getString("block");
      department=prefs.getString("department");
      officeNumber=prefs.getString("officeNumber");
      userId=prefs.getInt("userId");

      print("id is integer is =+++++++++++++++"+userId.toString());

    });


  }


  String _selectedDepartment = "Select Department";
  final selectedDepartmentList = [

    "Select Department",
    "Computer Science",
    'Staff',
    'Student',



  ];


  String _selectedBlock = "Select Block";
  final selectedBlockList = [
    "Select Block",
    "A","B","C"



  ];

  ApiServices apiServices=ApiServices();


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:

          Stack(

            children: [




              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey.shade100,
                child: Form(

                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.only(top:20.h),

                    child: Center(
                      child: Container(

                        //  height: 570.h,

                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,


                            children: [

                              SizedBox( height:10.h),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h, left: 0, bottom: 10.h),
                                child:  Center(
                                  child: Text(
                                    "Account Details",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  width: 140.w,
                                  height: 140.h,
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





                              SizedBox(height: 30.h,),
                              Center(
                                child: Container(
                                  width: 300.w,
                                  height: 45.h,

                                  child: TextFormField(
                                    controller: TextEditingController(text: name.toString()),
                                    onChanged: (value){
                                      name=value;
                                    },
                                    style: TextStyle(color: Colors.black),

                                    decoration: InputDecoration(

                                      label: Text("Name") ,

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
                                    controller: TextEditingController(text: email.toString()),
                                    onChanged: (value){
                                      email=value;
                                    },
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
                                    controller: TextEditingController(text: officeNumber.toString()),
                                    onChanged: (value){
                                      officeNumber=value;
                                    },
                                    style: TextStyle(color: Colors.black),

                                    decoration: InputDecoration(

                                      label: Text("Number") ,

                                      border: OutlineInputBorder(),
                                    ),),
                                ),
                              ),

                              Row(
                                children: [

                                  Center(
                                    child: Container(
                                        width: 150.w,

                                        margin:  EdgeInsets.only(top: 10.h,left:30.w),
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
                                                      padding:  EdgeInsets.only(left:1.0),
                                                      child: Text(e,style: TextStyle(color: Colors.black,fontSize: 12.sp),),
                                                    ), value: e);
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedDepartment = newValue as String;

                                                });
                                              },
                                              isExpanded: true,
                                            ))),
                                  ),
                                  Container(
                                    width: 140.w,
                                    height: 50.h,
                                    margin: EdgeInsets.only(top:8.h,left: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.r),
                                        border: Border.all(width: 1,color: Colors.grey)
                                    ),
                                    child: Center(child: Text(department),),
                                  ),
                                  SizedBox(width: 10.w,),
                                ],
                              ),

                              SizedBox(height: 10.h,),

                              Row(
                                children: [

                                  Center(
                                    child: Container(
                                        width: 150.w,

                                        margin:  EdgeInsets.only(top: 0.h,left:30.w),
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
                                                      padding:  EdgeInsets.only(left:2.w),
                                                      child: Text(e,style: TextStyle(color: Colors.black,fontSize: 10.sp),),
                                                    ), value: e);
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _selectedBlock = newValue as String;

                                                });
                                              },
                                              isExpanded: true,
                                            ))),
                                  ),
                                  Container(
                                    width: 140.w,
                                    height: 50.h,
                                    margin: EdgeInsets.only(top:0.h,left: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.r),
                                        border: Border.all(width: 1,color: Colors.grey)
                                    ),
                                    child: Center(child: Text(block),),

                                  ),
                                  SizedBox(width: 10.w,),
                                ],
                              ),


                              SizedBox(height: 10.h,),
                              Center(
                                child: SizedBox(
                                    width: 300.w,
                                    height: 45.h,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),

                                      controller: TextEditingController(text: password.toString()),
                                      onChanged: (value){
                                        password=value;
                                      },
                                      decoration: InputDecoration(label: Text("Password") ,

                                        border: OutlineInputBorder(),

                                      ),)),
                              ),
                              Stack(
                                  alignment:AlignmentDirectional.topStart ,
                                  children: [

                                    /*  Padding(
                                      padding:  EdgeInsets.only(top:7.h),
                                      child: Center(child:isVisible==true? CircularProgressIndicator():Container()),
                                    ),*/



                                    Center(
                                      child:   Container(
                                        margin: EdgeInsets.only(top:30.h,bottom: 20.h),
                                        width: 250.w,
                                        height: 45.h,
                                        child:ElevatedButton(
                                            onPressed:()async{

                                              String res=await apiServices.updateProfile(userId, password, _selectedDepartment, _selectedBlock, officeNumber);


                                                Navigator.push(context, MaterialPageRoute(builder: (context){return Profile();
                                                }));





                                            },






                                            child:  Text("Save Changes",style: TextStyle(color: Colors.white),),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.deepPurpleAccent.shade100,
                                              shape:
                                              RoundedRectangleBorder(
                                                side: BorderSide(color:Colors.deepPurpleAccent.shade200, width: 1.w),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    5.0.r),
                                              ),
                                            )),),
                                    ),






                                  ] ),







                              Center(
                                child: _isLoading
                                    ? CircularProgressIndicator() // Show CircularProgressIndicator when loading
                                    :Container(),)
                            ]
                        ),
                      ),
                    ),

                  ),
                ),
              ),





              //tree 1


              //tree 2



            ],
          ),
        )
    );
  }}






