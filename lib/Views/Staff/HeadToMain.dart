

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:juw/ApiServices/Api.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomDrawer.dart';
import 'package:juw/widgets/CustomTecnicianDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HeadToMail extends StatefulWidget{
  @override
  State<HeadToMail > createState() => _HeadToMail ();
}

class _HeadToMail  extends State<HeadToMail>{
  @override
  //The instance to be injected
  bool _isLoading = false;

  final _formKey=GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  ApiServices apiServices=ApiServices();

  String? name,email;

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




    });


  }






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
                              padding: EdgeInsets.only(top: 30.h, left: 30.w, bottom: 10.h),
                              child:  Text(
                                "Write a Complaint to Head",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                            ),



                            SizedBox( height:10.h),
                            Center(
                              child: Container(
                                width: 300.w,
                                margin: EdgeInsets.only(left: 0.w),
                                child: TextFormField(
                                  controller: descriptionController,
                                  maxLines: 7,
                                  decoration: InputDecoration(
                                    hintText: "Complaint",

                                    border: OutlineInputBorder(),
                                  ),
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
                                          onPressed:()async{

                                            await apiServices.sendMail(name.toString(), email.toString(), descriptionController.text);

                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return HeadToMail();
                                            }));


                                          },






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






