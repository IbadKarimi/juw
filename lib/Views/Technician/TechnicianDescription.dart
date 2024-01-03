

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomTecnicianDrawer.dart';



class AddDescription extends StatefulWidget{
  @override
  State<AddDescription > createState() => _AddDescription ();
}

class _AddDescription  extends State<AddDescription >{
  @override
  //The instance to be injected
  bool _isLoading = false;

  final _formKey=GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();





  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
        drawer: CustomTechnicianDrawer(),
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

                    child: Container(
                      width: 350.w,
                      height: 470.h,

                      color: Colors.white,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,


                          children: [

                            SizedBox( height:10.h),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h, left: 55.w, bottom: 10.h),
                              child:  Text(
                                "Add Description",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                            ),



                            SizedBox( height:10.h),
                            Container(
                              width: 300.w,
                              margin: EdgeInsets.only(left: 50.w),
                              child: TextFormField(
                                controller: descriptionController,
                                maxLines: 7,
                                decoration: InputDecoration(
                                hintText: "Description",

                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),



                            Stack(
                                alignment:AlignmentDirectional.topStart ,
                                children: [





                                  Center(
                                    child:

                                    Container(
                                      margin: EdgeInsets.only(top:60.h,bottom: 20.h),
                                      width: 250.w,
                                      height: 45.h,
                                      child:ElevatedButton(
                                          onPressed:(){},






                                          child:  Text("Send",style: TextStyle(color: Colors.white),),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepPurpleAccent.shade200,
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





              //tree 1


              //tree 2



            ],
          ),
        )
    );
  }}






