

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juw/ApiServices/Api.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomSupervisorDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../../Models/CategoriesModel.dart';
import '../../Models/SupervisorModel.dart';
import '../../Models/UserModel.dart';
import '../../widgets/CustomTecnicianDrawer.dart';
import 'package:intl/intl.dart';



class TechnicianComplaint extends StatefulWidget{
  @override
  State< TechnicianComplaint  > createState() => _TechnicianComplaint ();
}

class _TechnicianComplaint   extends State< TechnicianComplaint >{
  @override
  //The instance to be injected
  int? categoryId;
  int ?subCategoryId;
  List<UserModel> getComplaintData=[];
  List<CategoriesModel> getCategoryData=[];
  List<CategoriesModel> getSubCategoryData=[];
  List<SupervisorModel> getSuperVisorComplaintData=[];
  ApiServices apiService=ApiServices();
  String?categoryName;
  String?subCategoryName;

  int? userId;
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
        formattedSelectedDateTime = DateFormat('dd/MM/yyyy hh:mm a').format(combinedDateTime);


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

  void initState(){
    onLoad();
    apiService.getComplain().then((value){
      setState(() {
        getComplaintData.addAll(value);
      });

      for(int i=0;i<getComplaintData.length;i++){
        print("name is ==========="+getComplaintData[i].status.toString());
      }
    });
    apiService.getSupervisorComplaint().then((value){
      setState(() {
        getSuperVisorComplaintData.addAll(value);
      });

      for(int i=0;i<getSuperVisorComplaintData.length;i++){
        print("name is ==========="+getSuperVisorComplaintData[i].status.toString());
      }
    });

    apiService.getCategory().then((value){
      setState(() {
        getCategoryData.addAll(value);
      });

      for(int i=0;i<getCategoryData.length;i++){
        print("name is ==========="+getCategoryData[i].categoryName.toString());
      }
    });

    apiService.getSubCategory().then((value){
      setState(() {
        getSubCategoryData.addAll(value);
      });

      for(int i=0;i<getSubCategoryData.length;i++){
        print("name is ==========="+getSubCategoryData[i].subCategoryName.toString());
      }
    });


    super.initState();
  }
  onLoad()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {

      userId=prefs.getInt("userId");

      print("id is integer is =+++++++++++++++"+userId.toString());

    });


  }



  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomTechnicianDrawer(),
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
                                for(int i=0;i<getComplaintData.length;i++)
                                  if(getComplaintData[i].technicianId==userId)

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
                                              fontSize: 12.sp,
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
                                              fontSize: 12.sp,
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
                                              fontSize: 12.sp,
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
                                              fontSize: 12.sp,
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
                                              fontSize: 12.sp,
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
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),





                                      ],),



                                    Container(
                                      margin: EdgeInsets.only(top:30.h,left: 30.w),
                                      width: 1,
                                      height: 230.h,// Adjust the width to control the line thickness
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 20.w,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [



                                        Padding(
                                          padding: EdgeInsets.only(top: 30.h, left: 5.w, ),
                                          child:  Text(
                                            getComplaintData[i].complaintId.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 5.w, ),
                                          child:  Text(
                                            "Staff",
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
                                            getComplaintData[i].title.toString(),
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
                                            "TECHNICIAN",
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
                                            getComplaintData[i].createdAT.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left: 5.w,bottom: 0.h ),
                                          child:  Text(
                                            getComplaintData[i].resolvedAT.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Row(children: [
                                          SizedBox(width: 0.w,),
                                          //--Icons eyee
                                          IconButton(onPressed: (){
                                            print("CategoryId"+ getSuperVisorComplaintData[i].categoryId.toString());
                                            print("Sub CategoryId"+ getSuperVisorComplaintData[i].subCategoryId.toString());
                                            for(int index=0;index<getCategoryData.length;index++){
                                              if(getCategoryData[index].categoryId== getSuperVisorComplaintData[i].categoryId){
                                                setState(() {
                                                  categoryName=getCategoryData[index].categoryName.toString();
                                                  print("Category Name is "+categoryName.toString());

                                                });

                                              }

                                            }
                                            for(int index=0;index<getSubCategoryData.length;index++){
                                              if(getSubCategoryData[index].subCategoryId== getSuperVisorComplaintData[i].subCategoryId){
                                                setState(() {
                                                  subCategoryName=getSubCategoryData[index].subCategoryName.toString();
                                                  print("Sub Category Name is "+subCategoryName.toString());
                                                });


                                              }}
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
                                                              getComplaintData[i].title.toString(),
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
                                                            categoryName.toString(),
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
                                                            subCategoryName.toString(),
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
                                                            getComplaintData[i].description.toString(),
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
                                                          padding:  EdgeInsets.only(left:170.w,top: 10.h),
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
                                                                    color: Colors.pink,
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




                                          },
                                              icon: Icon(Icons.task_alt_outlined,color: Colors.blue,size: 20.sp,)),



                                          IconButton(onPressed: (){
                                           print( getComplaintData[i].complaintId.toString());
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
                                                              "Add Deadline",
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
                                                                    padding:  EdgeInsets.only(left:5.w), child:Text( "dd/mm//yy",style: TextStyle(color: Colors.black,),),)
                                                                ],
                                                              )

                                                          ),
                                                        ),

                                                        SizedBox(height: 10.w,),














                                                        SizedBox(height: 20.h,),

                                                        Divider(),





                                                        Padding(
                                                          padding:  EdgeInsets.only(left:100.w,top: 10.h),
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

                                                                print(formattedSelectedDateTime.toString().toString());
                                                                print(getComplaintData[i].complaintId.toString().toString());
                                                                var response=await apiService.technicianRequestDateChange(selectedDateTime as DateTime,getComplaintData[i].complaintId as int );
                                                              if(response=="200"){
                                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                                    return TechnicianComplaint();
                                                                  }));
                                                                }

                                                              },


                                                              child: Padding(
                                                                padding: EdgeInsets.only(left: 0, top: 10),
                                                                child: Text(
                                                                  "Submit",
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

                                          }, icon: Icon(Icons.refresh,color: Colors.blue,size: 20.sp,)),


                                        ],),







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