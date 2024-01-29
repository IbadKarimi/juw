

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juw/ApiServices/Api.dart';
import 'package:juw/widgets/CustomAppBar.dart';
import 'package:juw/widgets/CustomSupervisorDrawer.dart';
import 'dart:io';

import '../../Models/CategoriesModel.dart';
import '../../Models/SupervisorModel.dart';
import '../../Models/UserModel.dart';



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
  ApiServices apiService=ApiServices();
  List<SupervisorModel> getSuperVisorComplaintData=[];
  List<CategoriesModel> getCategoryData=[];
  List<CategoriesModel> getSubCategoryData=[];
  List<UserModel> getTechnicianData=[];
  String?categoryName;
  String?subCategoryName;


  void initState(){
    apiService.getTechnician().then((value){
      setState(() {
        getTechnicianData.addAll(value);
      });

      for(int i=0;i<getTechnicianData.length;i++){
        print("name is ==========="+getTechnicianData[i].name.toString());
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
  int ? selectedUserId;
  int ? complaintId;


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
                                for(int i=0;i<getSuperVisorComplaintData.length;i++)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //loop add here

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
                                            "STATUS",
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
                                      margin: EdgeInsets.only(top:30.h,left: 20.w),
                                      width: 1,
                                      height: 280.h,// Adjust the width to control the line thickness
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
                                            getSuperVisorComplaintData[i].complaintId.toString(),
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
                                            getSuperVisorComplaintData[i].title.toString(),
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
                                            "Technician",
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
                                            getSuperVisorComplaintData[i].status.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Padding(
                                          padding: EdgeInsets.only(top: 10.h, left:5.w, ),
                                          child:  Text(
                                            getSuperVisorComplaintData[i].createdAt.toString(),
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
                                            getSuperVisorComplaintData[i].resolveAt.toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),


                                        Row(children: [
                                          SizedBox(width: 10.w,),
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
                                                            getSuperVisorComplaintData[i].title.toString(),
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
                                                          getSuperVisorComplaintData[i].description.toString(),
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
                                            setState(() {
                                              complaintId=getSuperVisorComplaintData[i].complaintId;
                                              print("Complaint Id is "+complaintId.toString());
                                            });

                                            showDialog(context: context, builder: (context){
                                              return
                                              StatefulBuilder(
                                                  builder: (context, setState) {

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


                                                      SizedBox(height: 10.w,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 300.w,

                                                        margin:  EdgeInsets.only(top: 10.h,left:0.w),
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: Colors.black38, width: 1),
                                                            borderRadius: BorderRadius.circular(5.r),
                                                            boxShadow: <BoxShadow>[]),
                                                        child: DropdownButtonHideUnderline(
                                                            child:DropdownButton<int>(
                                                        value: selectedUserId,
                                                        onChanged: (userId) {
                                                          setState(() {
                                                            selectedUserId = userId;
                                                            // Perform any actions you need with the selected userId
                                                            print("Selected UserId: $selectedUserId");
                                                          });
                                                        },
                                                        items: getTechnicianData.map((UserModel users) {
                                                          return DropdownMenuItem<int>(
                                                            value: users.id,
                                                            child: Text(users.name.toString()),
                                                          );
                                                        }).toList(),
                                                      ))),
                                                      SizedBox(height: 20),
                                                      // You can display additional information about the selected user here
                                                      selectedUserId != null
                                                          ? Text("Selected UserId: $selectedUserId")
                                                          : Text("Select a user"),
                                                    ],
                                                  )

                                                     /* Container(
                                                          width: 300.w,

                                                          margin:  EdgeInsets.only(top: 10.h,left:0.w),
                                                          decoration: BoxDecoration(
                                                              border: Border.all(color: Colors.black38, width: 1),
                                                              borderRadius: BorderRadius.circular(5.r),
                                                              boxShadow: <BoxShadow>[]),
                                                          child: DropdownButtonHideUnderline(
                                                              child: DropdownButtonFormField(
                                                                value:_selectedDepartment,
                                                                items: getTechnicianData.map((e) {
                                                                  return DropdownMenuItem<String>(
                                                                      child:
                                                                      Padding(
                                                                        padding:  EdgeInsets.only(left:2.0),
                                                                        child: Text(e.toString(),style: TextStyle(color: Colors.black),),
                                                                      ), value: e.toString());
                                                                }).toList(),
                                                                onChanged: (newValue) {



                                                                    setState((){
                                                                      _selectedDepartment = newValue as String;
                                                                    });


                                                                },
                                                                isExpanded: true,
                                                              ))),*/












                                                      ,SizedBox(height: 20.h,),

                                                      Divider(),





                                                      Padding(
                                                        padding:  EdgeInsets.only(left:110.w,top: 10.h),
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

                                                             var response=await apiService.assignTechnician(selectedUserId, complaintId!);
                                                             if(response=="200"){
                                                               Navigator.push(context, MaterialPageRoute(builder:(context){
                                                                 return SupervisorComplaint();
                                                               }));
                                                             }

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
    }); });

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

    SizedBox(width: 80.w,),
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


                                        IconButton(onPressed: ()async{
                                          String? response= await apiService.deleteComplaint(getSuperVisorComplaintData[i].complaintId!);
                                          if(response=="200"){
                                            setState(() {
                                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                                return SupervisorComplaint();
                                              }));
                                            });

                                          }



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