

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';



class SignUpFormWidget extends StatefulWidget{
  @override
  State<SignUpFormWidget > createState() => _SignUpFormWidget ();
}

class _SignUpFormWidget  extends State<SignUpFormWidget>{
  @override
  //The instance to be injected
  bool _isLoading = false;

  final _formKey=GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController officeNoController = TextEditingController();



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


  Widget build(BuildContext context) {
    return Scaffold(
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
                        width: 350.w,
                        height: 590.h,

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
                                    "SIGNUP HERE",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 10.h, left: 24.w, bottom: 0.h),
                                        child: Text(
                                          "Adventure Starts Here !",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                  ),
                                  SizedBox(width: 5.w,),
                                  Container(
                                    width: 20.w,
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(80),
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            filterQuality: FilterQuality.low,
                                            image: AssetImage("lib/images/logos/hi.png")
                                        )
                                    ),
                                  ),
                                ],
                              ),

                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 5.h, left: 24.w, bottom: 0.h),
                                    child: Text(
                                      "Make your app management easy and fun",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )),
                              ),

                              SizedBox(height: 10.h,),
                              Center(
                                child: Container(
                                  width: 300.w,
                                  height: 45.h,

                                  child: TextFormField(
                                    controller: emailController,
                                    style: TextStyle(color: Colors.black),

                                    decoration: InputDecoration(

                                      label: Text("User Name") ,

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
                                    controller: emailController,
                                    style: TextStyle(color: Colors.black),

                                    decoration: InputDecoration(

                                      label: Text("Email") ,

                                      border: OutlineInputBorder(),
                                    ),),
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left:24.w),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 145.w,

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

                                    SizedBox(width: 10.w,),
                                    Container(
                                        width: 145.w,

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
                                                      padding:  EdgeInsets.only(left:2.w),
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
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Center(
                                child: SizedBox(
                                    width: 300.w,
                                    height: 45.h,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),

                                      controller: officeNoController,
                                      decoration: InputDecoration(label: Text("Office Number") ,

                                        border: OutlineInputBorder(),

                                      ),)),
                              ),
                              SizedBox(height: 10.h,),
                              Center(
                                child: SizedBox(
                                    width: 300.w,
                                    height: 45.h,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.black),

                                      controller: passwordController,
                                      decoration: InputDecoration(label: Text("Password") ,
                                        suffixIcon:Icon(Icons.remove_red_eye_outlined,color: Colors.grey,),
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
                                        width: 300.w,
                                        height: 45.h,
                                        child:ElevatedButton(
                                            onPressed:(){},






                                            child:  Text("SIGN UP",style: TextStyle(color: Colors.white),),
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

                              Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 60.w, bottom: 0.h),
                                      child: Text(
                                        "Already have an Account ?",

                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(top: 5.h, left: 30.w, bottom: 0.h),
                                      child: Text(
                                        "Sign in Insted",
                                        style: TextStyle(
                                          color: Colors.deepPurpleAccent.shade200,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                ],
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left:50.w),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width: 120.w,
                                        child: Divider()),

                                    Padding(
                                        padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.h),
                                        child: Text(
                                          "or",
                                          style: TextStyle(
                                            color: Colors.deepPurpleAccent.shade200,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only( right: 24.w),
                                        width: 120.w,
                                        child: Divider()),

                                  ],
                                ),
                              ),

                              SizedBox(height: 15.h,),
                              Padding(
                                padding:  EdgeInsets.only(left:80.w),
                                child: Row(
                                  children: [

                                    //fb
                                    Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(80),
                                          image: DecorationImage(
                                              filterQuality: FilterQuality.low,
                                              fit: BoxFit.contain,
                                              image: AssetImage("lib/images/logos/fb.jpg")
                                          )
                                      ),
                                    ),
                                    //tw
                                    SizedBox(width: 30.w,),
                                    Container(
                                      width: 30.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(80),
                                          image: DecorationImage(
                                              filterQuality: FilterQuality.low,
                                              fit: BoxFit.contain,
                                              image: AssetImage("lib/images/logos/twitter.png")
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 30.w,),
                                    //git
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(80),
                                          image: DecorationImage(
                                              filterQuality: FilterQuality.low,
                                              fit: BoxFit.contain,
                                              image: AssetImage("lib/images/logos/github.png")
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 30.w,),
                                    //google
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(80),
                                          image: DecorationImage(
                                              filterQuality: FilterQuality.low,
                                              fit: BoxFit.contain,
                                              image: AssetImage("lib/images/logos/google.png")
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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




              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height-50),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(

                    height: 50.h,

                    decoration: BoxDecoration(

                        image: DecorationImage(
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.fill,
                            image: AssetImage("lib/images/pages/auth-v1-mask-light.png")
                        )
                    ),

                  ),
                ),
              ),
              //tree 1
              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height-80.w,right: 300.w),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    width: 120.w,
                    height: 100.h,

                    decoration: BoxDecoration(

                        image: DecorationImage(
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.fill,
                            image: AssetImage("lib/images/pages/auth-v1-tree.png")
                        )
                    ),

                  ),
                ),
              ),

              //tree 2


              Padding(
                padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height-90.w),
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(

                    width: 120.w,
                    height: 90.h,

                    decoration: BoxDecoration(

                        image: DecorationImage(
                            filterQuality: FilterQuality.low,
                            fit: BoxFit.fill,
                            image: AssetImage("lib/images/pages/auth-v1-tree-2.png")
                        )
                    ),

                  ),
                ),
              ),
            ],
          ),
        )
    );
  }}






